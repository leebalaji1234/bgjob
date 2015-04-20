class AuthenticationModule
	include Sidekiq::Worker
	def perform 
	 tempReceives = RequestReceiverTemp.where(status: 1)
	 tempReceives.each do |receiver| #   
			 receiver.status = 2 #completed authentication request 
		     receiver.save
		     ServiceModule.perform_async() 
	 end

	end
end