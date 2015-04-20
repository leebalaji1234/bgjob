class ServiceModule
	include Sidekiq::Worker
	def perform 
	 tempReceives = RequestReceiverTemp.where(status: 2)
	 tempReceives.each do |receiver| #   
			 receiver.status = 3 #completed authentication request 
		     receiver.save 
	 end

	end
end