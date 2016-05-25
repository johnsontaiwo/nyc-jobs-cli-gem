class NycJobs::Jobs

attr_accessor :date, :Business_title, :id, :location, :agency
 
 @@all = []

 def initialize(date = nil, id = nil, location = nil, agency = nil )
  @date = date
  @id = id 
  @location = location
  @agency = agency
  @@all << self
 end
 
 def self.scrape_nyc_jobs
  doc = Nokogiri::HTML(open("http://www1.nyc.gov/jobs"))
  
 end

  def self.list_jobs_by_category
    doc = Nokogiri::HTML(open("https://a127-jobs.nyc.gov/index_new.html?category=CAS"))
     binding.pry
  end

end