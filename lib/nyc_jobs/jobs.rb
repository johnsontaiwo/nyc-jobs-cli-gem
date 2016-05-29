class NycJobs::Jobs

attr_accessor :date, :business_title, :job_id, :location, :agency, :category
 
 

 def initialize(category = nil, url = nil)
   @category = category
   @url = url
   
 end
  
  def self.all
    @@all ||= scrape_nyc_jobs
    
  end

 def categories(category)
  @category
 end

 def self.scrape_nyc_jobs
  doc = Nokogiri::HTML(open("http://www1.nyc.gov/jobs"))
  
  categories = doc.search("div.module-content .jobsbutton")
  
  jobs_categories = categories.collect{|b| new( b.text.gsub("/n", "").strip, "#{b.search("a").attribute("href").value}" )}
  
  
  end
  
  def self.list_jobs_categories
    NycJobs::Jobs.all.collect.with_index(1) {|category, i| puts "#{i}. #{category.category}"}
  end
     
end
    

