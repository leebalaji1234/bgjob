class CsvModule
 	include Sidekiq::Worker
 	include WorkerStatus
 	include WorkerHelper
	sidekiq_options :queue => :csvfile, :backtrace => true
	def perform(tempFile,rguid) 
		WorkerStatus.setModuleStatus("CsvModule","Working")
		dirPath = '/home/balaji/csvfiles/'
		generateFileName = rand(1000..10000).to_s + (Time.now.to_i).to_s + ".csv"
		@fileLocation = dirPath+generateFileName 
          
        givingPermission = `echo balaji | sudo -S  chown -R balaji:balaji #{tempFile} && chmod 777 #{tempFile}`
        createNewFile = `echo balaji | sudo -S mv #{tempFile} #{@fileLocation}`

        # tFile = File.open(tempFile, "r+")
        # oFile  = File.open(@fileLocation,"w:ASCII-8BIT"){|f| f.write(tFile.read)}



		@CsvFileTemp = CsvFileTemp.find_by_flocation(tempFile)
		@CsvFileTemp.status  = 1
		@CsvFileTemp.save
		
		@CsvFile = CsvFile.new
		@CsvFile.filename = generateFileName
		@CsvFile.flocation = dirPath
		@CsvFile.fsize = `stat -c %s #{@fileLocation}`
		@CsvFile.status = 1
		@CsvFile.save

		@CsvMap = CsvMap.new
		@CsvMap.csvid = @CsvFile.id
		@CsvMap.guid = rguid 
		@CsvMap.save
		if(@CsvMap.id)
			WorkerStatus.setModuleStatus("CsvModule","Completed")
			WorkerHelper.updateGenerator(rguid,'csv')
			GeneratorModule.perform_async() 
		end
		 
	end 
end