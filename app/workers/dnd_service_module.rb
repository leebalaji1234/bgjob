class DndServiceModule
	include Sidekiq::Worker
	sidekiq_options :queue => :dndservice, :backtrace => true

	def perform 
	end
end