class ServiceModule
	include Sidekiq::Worker
	sidekiq_options :queue => :service, :backtrace => true

	def perform 
	  OptinServiceModule.perform_async()
	end
end