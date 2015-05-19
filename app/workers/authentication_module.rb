class AuthenticationModule
 	include Sidekiq::Worker
 	include WorkerStatus

	sidekiq_options :queue => :authentication, :backtrace => true
	def perform 
	 tempAuthReceives = AuthenticatesTemp.where(status: 0) # Need to add limit  of count
		 tempAuthReceives.each do |receiver| #   
		 	
				 receiver.status = 1 #completed authentication request 
			     receiver.save
			     processFile(receiver,receiver.guid)
			     sendReport(receiver,"Request Processing",101)
			     initiateGenerator(receiver.guid)
			     GeneratorModule.perform_async()
			 # 	ServiceModule.perform_async() 
		 end 
	end
	def sendReport(receivedData,messageToDisplay,displayErrorCode)
      deliveryNotification = RequestReceiver.new
      deliveryNotification.ori_params = receivedData.params
      deliveryNotification.val_params =  ''
      deliveryNotification.message = messageToDisplay
      deliveryNotification.code = displayErrorCode
      deliveryNotification.guid = receivedData.guid
      deliveryNotification.status = 0
      deliveryNotification.save

  end

  def initiateGenerator(rguid)
         
	  	@csvDataMap = CsvMap.find_by_guid(rguid)
	  	@csvData = CsvFile.find(@csvDataMap.csvid) 
	  	@csvFileName = @csvData.flocation + @csvData.filename
	  	@csvGetCount = `cat  #{@csvFileName} | wc -l`
	 
	  	@generator = Generator.new
	  	@generator.csvfile = @csvFileName
	  	@generator.csvcount = @csvGetCount
	  	@generator.processedcount = 1
	  	@generator.guid = rguid
	  	@generator.status = 0 
	  	@generator.save
 
  end

	def processFile(receivedData,rguid)

	    objSeperationParams  = eval(receivedData.params)

	    objSeperationParams.each do |keyParams,valParams|
	    	if (/atvc[0-9]/.match(keyParams))  
            nstr = keyParams.to_s.gsub('t','o') 
            sstr = keyParams.to_s.gsub('t','s')
	        @AudioFileTemp = AudioTemp.new
	        @AudioFileTemp.audioname = objSeperationParams[nstr.to_sym] 
	        @AudioFileTemp.flocation = Base64.decode64(objSeperationParams[keyParams])
	        @AudioFileTemp.fsize = objSeperationParams[sstr.to_sym]
	        @AudioFileTemp.status = 0
	        @AudioFileTemp.save
 			cliporder = /[0-9]/.match(keyParams)
	        AudioModule.perform_async(Base64.decode64(objSeperationParams[keyParams]),rguid,cliporder)

	      end
	      if (/ctempcontactsfile/.match(keyParams)) 
	        @csvFileTemp = CsvFileTemp.new
	        nstr1 = keyParams.to_s.gsub('temp','o') 
            sstr1 = keyParams.to_s.gsub('temp','s') 
	        @csvFileTemp.filename = objSeperationParams[nstr1.to_sym]
	        @csvFileTemp.flocation = Base64.decode64(objSeperationParams[keyParams])
	        @csvFileTemp.fsize = objSeperationParams[sstr1.to_sym]
	        @csvFileTemp.status = 0
	        @csvFileTemp.save 

	        CsvModule.perform_async(Base64.decode64(objSeperationParams[keyParams]),rguid)

	      end
	      if (/rvc[0-9]/.match(keyParams)) 
	        audioData = Audio.find(valParams)
	        audioFileName = audioData.Flocation+audioData.audioname
	        if (File.exist?(audioFileName) == false)
	           
	        end
	      end
	      if (/rcontactsfile/.match(keyParams)) 
	        csvDbData = CsvFile.find(valParams)
	        csvFileName = csvDbData.Flocation+csvDbData.Filename
	        if (File.exist?(csvFileName) == false)
	           
	        end
	       
	      end
	    end

    end

end