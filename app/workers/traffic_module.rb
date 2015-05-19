class TrafficModule
	include Sidekiq::Worker
	sidekiq_options :queue => :traffic, :backtrace => true

	def perform 
	end
end