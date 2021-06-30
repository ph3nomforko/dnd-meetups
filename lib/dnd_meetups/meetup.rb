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
        @next_game.strftime("%l:%M %P on %B %d, %Y.")
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

    def audio_visual
        @audio_visual ||= doc.css("tbody tr[6] td[2]").text.strip
    end

    def language
        @language ||= doc.css("tbody tr[7] td[2]").text.strip
    end

    def new_players
        @new_players ||= doc.css("tbody tr[8] td[2]").text.strip
    end

    def mature_content
        @mature_content ||= doc.css("tbody tr[9] td[2]").text.strip
    end

    def pay_to_play
        @pay_to_play ||= doc.css("tbody tr[10] td[2]").text.strip
    end

    def pick_up_game
        @pick_up_game ||= doc.css("tbody tr[11] td[2]").text.strip
    end

    def description
        @description ||= doc.css("div.description").text.strip
    end

    def doc
        url = "https://app.roll20.net#{game_url}"
        @doc ||= Nokogiri::HTML(open(url))
    end

end