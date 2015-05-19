class GeneratorModule
	include Sidekiq::Worker
	sidekiq_options :queue => :generator, :backtrace => true 

	def perform
		generators = Generator.where(status: 0)
		@callFileLocation  = '/home/balaji/callfile/'
		generators.each do |generator|

			csvFileLocation = generator.csvfile
			csvProcessedCount = generator.processedcount.to_i
			csvFileCount = generator.csvcount.to_i
			csvLineArr = `sed -n #{csvProcessedCount},#{csvFileCount}p #{csvFileLocation}`.split
			pcount = 0
			csvLineArr.each_with_index do |val,key|
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