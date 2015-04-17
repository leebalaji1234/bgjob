class BasicController < ActionController::Base
	# ApplicationController
	def index
      # raise params.inspect
      @tempParams = RequestReceiverTemp.new
      @tempParams.params = params.to_s
      @tempParams.status = 0  # ready to process
      @tempParams.save
      render :text => "Request received successfully" 
	end
	def create
      # raise params.inspect
      @tempParams = RequestReceiverTemp.new
      @tempParams.params = params.to_s
      @tempParams.status = 0  # ready to process
      @tempParams.save
	end
end
