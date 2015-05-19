module WorkerStatus
 @strut = {}
  def self.setModuleStatus(modulename,status)  	
        @strut[modulename] = status 
  end
  def self.pingModuleStatus(modulename)
	return @strut[modulename]
  end
end