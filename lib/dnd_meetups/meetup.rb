class DNDMeetups::Meetup

    attr_accessor :name, :url, :game_url, :game_system, :game_type, :next_game, :players_needed, :frequency, :audio_visual, :language, :new_players, :mature_content, :pay_to_play, :pick_up_game, :description
    @@all = []
    
    def initialize(name=nil, game_url=nil)
        @name = name
        @game_url = game_url
        save
    end

    def self.all
        @@all
    end 

    def save
        @@all << self
    end

    def game_system
        @game_system ||= doc.css("span.playinggame").text.strip
    end

    def next_game
        @next_game ||= doc.css("span.nextgame").text.strip
        @next_game = Time.at(@next_game.to_i)
        @next_game.strftime("at %I:%M %P on %B %e, %Y.")
    end

    def players_needed
        @players_needed ||= doc.css("tbody tr[3] td[2]").text.strip
    end

    def game_type
        @game_type ||= doc.css("tbody tr[4] td[2]").text.strip
    end

    def frequency
        @frequency ||= doc.css("tbody tr[5] td[2]").text.strip
    end

    def doc
        url = "https://app.roll20.net#{game_url}"
        @doc ||= Nokogiri::HTML(open(url))
    end

end