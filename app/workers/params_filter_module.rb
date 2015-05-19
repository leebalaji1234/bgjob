class ParamsFilterModule
	include Sidekiq::Worker
  sidekiq_options :queue => :requestreceiver, :backtrace => true  #:retry => false

	def perform
    expectedParams  = %w(username pin)

    tempReceives = RequestReceiverTemp.where(status: 0)
    tempReceives.each do |receiver| #  
    paramsfiltered = JSON.parse(receiver.params)  
    filteredres = {}
    paramsfiltered.each do |item,index|  
     if(expectedParams.include?(item.downcase))
      filteredres[item.downcase] = paramsfiltered[item.downcase]
     end 
    end   
       
         if filteredres.blank?  
          sendInvalidReport(receiver,"Invalid Parameters",402)
          receiver.destroy  
         else
          receiver.status = 1 #process completed 
          receiver.save
          paramsvalidation(receiver)
         end 
     end 
	end
  def paramsvalidation(receivedData)

    objSeperationParams  = eval(receivedData.params)
    objSeperationParams.each do |keyParams,valParams|
      if (/asvc[0-9]/.match(keyParams) && objSeperationParams[keyParams] <= 0) 
        sendInvalidReport(receivedData,"Empty File Received",400)
        receivedData.destroy
        return false
      elsif (/cscontactsfile[0-9]/.match(keyParams) && objSeperationParams[keyParams] <= 0) 
        sendInvalidReport(receivedData,"Empty File Received",400)
        receivedData.destroy
        return false
      elsif (/rvc[0-9]/.match(keyParams)) 
        audioData = Audio.find(valParams)
        audioFileName = audioData.Flocation+audioData.audioname
        if (File.exist?(audioFileName) == false)
          sendInvalidReport(receivedData,"Invalid Audio Reference",401)
          receivedData.destroy
          return false
        end
      elsif (/rcontactsfile/.match(keyParams)) 
        csvDbData = CsvFile.find(valParams)
        csvFileName = csvDbData.Flocation+csvDbData.Filename
        if (File.exist?(csvFileName) == false)
          sendInvalidReport(receivedData,"Invalid Contacts Reference",401)
          receivedData.destroy
          return false
        end
      else 
         
      end

    end
       makeRequestProcessEntry(receivedData)

  end
  

  def sendInvalidReport(receivedData,messageToDisplay,displayErrorCode)
      
      deliveryNotification = RequestReceiver.new
      deliveryNotification.ori_params = receivedData.params
      deliveryNotification.val_params =  ''
      deliveryNotification.message = messageToDisplay
      deliveryNotification.code = displayErrorCode
      deliveryNotification.guid = receivedData.guid
      deliveryNotification.status = 0
      deliveryNotification.save

  end
  def makeRequestProcessEntry(receivedData)
      

      authMode = AuthenticatesTemp.new
      authMode.params = receivedData.params
      authMode.status = 0 
      authMode.guid = receivedData.guid 
      authMode.save
      
      AuthenticationModule.perform_async()
  end
end
