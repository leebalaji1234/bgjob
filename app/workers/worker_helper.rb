module WorkerHelper 
  def self.updateGenerator(referalguid,from)
  	   @generator = Generator.find_by_guid(referalguid)
         if (from == 'csv' && @generator)
		  	@csvDataMap = CsvMap.find_by_guid(referalguid)
		  	@csvData = CsvFile.find(@csvDataMap.csvid) 
		  	@csvFileName = @csvData.flocation + @csvData.filename
		  	@csvGetCount = `cat  #{@csvFileName} | wc -l`

		  	@generator.csvfile = @csvFileName
		  	@generator.csvcount = @csvGetCount
		    @generator.csvstatus = 1
		  	@generator.processedcount = 1
	     else 
		     @AudioMap = AudioMap.order("cliporder ASC").where(:guid => referalguid) 
		     audioArr = []
		     @AudioMap.each do |am|
		      audioData = Audio.find(am.audioid)
		      audioArr.push(audioData.audioname)
		     end
		     audioStr = audioArr.join('-$-')

	     	 @generator.audiocollection =  audioStr
	     	 @generator.audiostatus =  1  
	     end 
	     
	     @generator.status =  0
 	  	 @generator.save
 
  end
end