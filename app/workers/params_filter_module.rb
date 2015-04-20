class ParamsFilterModule
	include Sidekiq::Worker
	def perform
	 expectedParams  = %w(callerid phone)

	 tempReceives = RequestReceiverTemp.where(status: 0)
	 tempReceives.each do |receiver| #  
		paramsfiltered = JSON.parse(receiver.params)  
		filteredres = []
	 	paramsfiltered.each do |item,index|  
			 if(expectedParams.include?(item.downcase))
			  filteredres.push(item.downcase) 
			 end 
		end 
			if(filteredres.length == expectedParams.length) 
			 receiver.status = 1 #process request
			else
			 receiver.status = 2 #completed request	
			end 
		     receiver.save
		     AuthenticationModule.perform_async()
		end

	end
end
