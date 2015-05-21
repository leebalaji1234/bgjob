class GeneratorModule
	include Sidekiq::Worker

	sidekiq_options :queue => :generator, :backtrace => true 

	def perform
		generators = Generator.where( :status => 0 , :csvstatus => 1 , :audiostatus => 1 )
		@callFileLocation  = '/home/balaji/callfile/'
		generators.each do |generator|

			csvFileLocation = generator.csvfile
			csvProcessedCount = generator.processedcount.to_i
			csvFileCount = generator.csvcount.to_i
			csvLineArr = `sed -n #{csvProcessedCount},#{csvFileCount}p #{csvFileLocation}`.split
			pcount = 0
			csvLineArr.each_with_index do |val,key|
				audioStrings = generator.audiocollection
				audioStringsArr = audioStrings.split('-$-')

				clipString = ''
				audioStringsArr.each_with_index do |valAudio,keyAudio|
					keyAudiocounter = keyAudio + 1
					audioConvertedStr = valAudio.gsub('.wav','') 
					clipString  += <<EOD 
Set: clip#{keyAudiocounter}=#{audioConvertedStr}
EOD
				end 
				callfileName = SecureRandom.uuid + ".call"
				dialplanString = '/home/balaji/flow/flow(11).ivr' 
				callFilestring =<<EOD 
Channel: SIP/9791718441
Context: OBD
Extension: s
Priority: 1
Set: templateid=#{generator.templateid}
Set: userid=#{generator.userid}
Set: guid=#{generator.guid}
#{clipString}
Set: dialplan=#{dialplanString}
Set: engine=/usr/bin/php 
Set: app=/var/www/html/va/dialplanengine/ivr.php 
Set: source=gamma@10.130.225.125
Set: callerid=balaji
Set: destination=9791718441  
Callerid: balaji
Archive: no 
EOD
callFile = `echo "#{callFilestring}" > /home/balaji/callfile/#{callfileName}`
 				pcount = key+1

			end
            if (csvFileCount == pcount)
             generator.processedcount = pcount
			 generator.status = 1
			 generator.save
			else 
				generator.processedcount = pcount
				generator.save
			end
	    end
	end 
end