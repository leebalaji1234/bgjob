class OptinServiceModule
	include Sidekiq::Worker
	sidekiq_options :queue => :optinservice, :backtrace => true 

	def perform 
		 
	end 
end