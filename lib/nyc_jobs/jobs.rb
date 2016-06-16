class NycJobs::Jobs


attr_accessor :date, :business_title, :job_id, :location, :agency, :category, :url
 
 

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
  
  def self.find_jobs_by_category
    browser = Watir::Browser.new :firefox
    browser.goto "https://a127-jobs.nyc.gov/index_new.html?category=CAS"
     sleep 2
    doc = Nokogiri::HTML(open(browser.html))
    jobs = doc.search("a .PSLEVEL1COLUMNHDR")
     table = doc.search("table.PSLEVEL1GRIDWBO")
     doc.search("div .ps_pspagecontainer span .PSEDITBOX_DISPONLY")
     @date = doc.search("td.PSLEVEL1GRIDODDROWPSGRIDFIRSTCOLUMN div#win0divHRS__APP_JBSCH_I_OPEN_DT span.PSEDITBOX_DISPONLY").collect{|e| e.text.strip}
   binding.pry
  end

  end


