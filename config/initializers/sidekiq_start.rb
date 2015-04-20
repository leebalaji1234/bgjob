Thread.new do 
  while true  
     ParamsFilterModule.perform_async()  
     sleep 1 
  end
end