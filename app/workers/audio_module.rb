class AudioModule
	include Sidekiq::Worker
	include WorkerStatus
 	include WorkerHelper
	sidekiq_options :queue => :audio, :backtrace => true
	def perform(tempFile,rguid,corder)
		WorkerStatus.setModuleStatus("AudioModule","Working")
		dirPath = '/home/balaji/bgfiles/'
		dirPath_new = '/home/balaji/bgfiles/converted'

		generateFileName = rand(10..1000).to_s + (Time.now.to_i).to_s + ".wav"
		@fileLocation = dirPath+generateFileName 
		@fileLocationNew = dirPath_new+generateFileName 
          
        givingPermission = `echo balaji | sudo -S  chown -R balaji:balaji #{tempFile} && chmod 777 #{tempFile}`
        createNewFile = `echo balaji | sudo -S mv #{tempFile} #{@fileLocationNew}`

        # tFile = File.open(tempFile, "r+")
        # oFile  = File.open(@fileLocation,"w:ASCII-8BIT"){|f| f.write(tFile.read)}
		
		@AudioFileTemp = AudioTemp.find_by_flocation(tempFile)
		@AudioFileTemp.status  = 1
		@AudioFileTemp.save
		
		soxExecution = `/usr/bin/sox  #{@fileLocationNew} -r 8000 -c 1 -s -2  #{@fileLocation}`
        moveFile = `echo balaji | sudo -S mv #{@fileLocationNew} #{@fileLocation}`

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
		if(@AudioMap.id)
			WorkerStatus.setModuleStatus("AudioModule","Completed")
			WorkerHelper.updateGenerator(rguid,'audio')
			GeneratorModule.perform_async() 

		end
	end 
end