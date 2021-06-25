class DNDMeetups::Game
    attr_accessor :name, :available_seats, :description, :time, :game_type
    @@all = []

    def initialize(name, url)
        @name = name
        @url = url
        @available_seats = available_seats
        @description = description
        @time = time
        @game_type = game_type
    end

    def add_to_meetups
        @name.meetups << self unless @name.meetups.include?(self)
    end

    def save
        @@all << self
    end

    def get_game_details
        DNDMeetups:Scraper.scrape_game_info(self)
    end
    
end