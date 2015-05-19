class BlacklistServiceModule
	include Sidekiq::Worker
	sidekiq_options :queue => :blacklistservice, :backtrace => true

	def perform 
	end
end