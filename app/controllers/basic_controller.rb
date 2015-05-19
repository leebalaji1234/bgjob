class BasicController < ActionController::Base
       # ApplicationController
       def index 
        keyParams = :atvc1
        keyParams = (keyParams.to_s).gsub(/[t]/, 'o')
         raise keyParams.inspect
            getdata  = RequestReceiverTemp.find(25)
            dd  = getdata.params
            dd1  = eval(dd)
            dd1.each do |k2,v2|
                if (/atvc[0-9]/.match(k2) ) 
                 raise  Base64.decode64(dd1[k2]).inspect
              end
            end
            raise Base64.decode64(dd1['vc1']).inspect
            @GatewayParams = filer_params     
            @tempParams = RequestReceiverTemp.new
            @tempParams.params = @GatewayParams.to_s
            @tempParams.guid = SecureRandom.uuid
            @tempParams.status = 0  # ready to process
            @tempParams.save
            objResponse = {}
            objResponse['message'] = "Request Received"
            objResponse['code'] = 100
            objResponse['guid'] = @tempParams.guid 
            objResponse = objResponse.to_json 

 File.open('/home/balaji/testoutput.html', "w:ASCII-8BIT") { |f| f.write(@GatewayParams.to_s)}
             # ParamsFilterModule.perform_async() 
            render :json => objResponse
            
      end
      def create
            # @GatewayParams = filer_params 
            @tempParams = RequestReceiverTemp.new
            @tempParams.params = filer_params
            @tempParams.guid = SecureRandom.uuid
            @tempParams.status = 0  # ready to process
            @tempParams.save
            # ******** ------- Audio & csv file starts ------ ********
            # params.each do |k,v|
            #     if (/vc[0-9]/.match(k) )  
                    
            #         @AudioFileTemp = AudioTemp.new
            #         @AudioFileTemp.audioname = params[k].original_filename
            #         @AudioFileTemp.flocation = params[k].tempfile.path
            #         @AudioFileTemp.fsize = params[k].size()
            #         @AudioFileTemp.status = 0
            #         @AudioFileTemp.save
            #         AudioModule.perform_async(params[k].tempfile.path)


            #     end
                
            #     if (/contactsfile[0-9]/.match(k) ) 
            #         @csvFileTemp = CsvFileTemp.new
            #         @csvFileTemp.filename = params[k].original_filename
            #         @csvFileTemp.flocation = params[k].tempfile.path
            #         @csvFileTemp.fsize = params[k].size()
            #         @csvFileTemp.status = 0
            #         @csvFileTemp.save 
            #         CsvModule.perform_async(params[k].tempfile.path) 
            #     end
            # end 

            # ******** ------- Audio & csv file ends------ ********
            objResponse = {}
            objResponse['message'] = "Request Received"
            objResponse['code'] = 100
            objResponse['guid'] = @tempParams.guid 
            objResponse = objResponse.to_json 
            ParamsFilterModule.perform_async()
            render :json => objResponse 

      end
      private
      def filer_params 
            objParams = {}
            params.each do |k1,v1|
                if (/vc[0-9]/.match(k1) )  
                 objParams['at'+k1] = Base64.encode64(params[k1].tempfile.path)
                 objParams['ao'+k1] = params[k1].original_filename
                 objParams['as'+k1] = params[k1].size()
                elsif (/contactsfile/.match(k1) )  
                 objParams['ctemp'+k1] = Base64.encode64(params[k1].tempfile.path) 
                 objParams['co'+k1] = params[k1].original_filename
                 objParams['cs'+k1] = params[k1].size() 
                else
                 objParams[k1] = v1
                end

            end 
             objParams = JSON.generate(objParams) 
            return objParams
      end 

end
