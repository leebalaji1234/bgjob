class BasicController < ActionController::Base

      # ApplicationController
      def index 
            @GatewayParams = filer_params     
            @tempParams = RequestReceiverTemp.new
            @tempParams.params = @GatewayParams.to_s
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
             render :text => "Request received successfully"
      end
      private
      def filer_params 
            objParams = params.to_json   
            return objParams
      end 

end
