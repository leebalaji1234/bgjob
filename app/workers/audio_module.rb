class AudioModule
	include Sidekiq::Worker
	sidekiq_options :queue => :audio, :backtrace => true
	def perform(tempFile,rguid,corder)
		dirPath = '/home/balaji/bgfiles/'
		generateFileName = (Time.now.to_i).to_s + ".wav"
		@fileLocation = dirPath+generateFileName 
          
        givingPermission = `echo balaji | sudo -S  chown -R balaji:balaji #{tempFile} && chmod 777 #{tempFile}`
        createNewFile = `echo balaji | sudo -S mv #{tempFile} #{@fileLocation}`

        # tFile = File.open(tempFile, "r+")
        # oFile  = File.open(@fileLocation,"w:ASCII-8BIT"){|f| f.write(tFile.read)}
		
		@AudioFileTemp = AudioTemp.find_by_flocation(tempFile)
		@AudioFileTemp.status  = 1
		@AudioFileTemp.save
		
		soxExecution = `/usr/bin/sox  #{@fileLocation} -r 8000 -c 1 -s -2  #{@fileLocation}`
		@AudioFile = Audio.new
		@AudioFile.audioname = generateFileName
		@AudioFile.flocation = dirPath
		@AudioFile.fsize = `stat -c %s #{@fileLocation}`
		@AudioFile.status = 1
		@AudioFile.save

		@AudioMap = AudioMap.new
		@AudioMap.audioid = @AudioFile.id
		@AudioMap.guid = rguid
		@AudioMap.cliporder = corder
		@AudioMap.save
		 
	end 
end