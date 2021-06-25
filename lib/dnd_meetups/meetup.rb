class DNDMeetups::Meetup

    attr_accessor :name, :location, :game

    def self.today
        #Return a bunch of meetups
        # Here DOCS for strings http://blog.jayfields.com/2006/ruby-multiline-strings-here-doc-or.html
        puts "This Week's Dungeons and Dragons Meetups"
        puts "Meetups"
        #Scrape website
        self.scrape_meetups     
    end

    def self.scrape_meetups
        meetups = []
        meetups << self.scrape_roll_twenty
        meetups
    end

    

end