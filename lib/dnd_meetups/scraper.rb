class DNDMeetups::Scraper

    def self.scrape_games_list
        doc = Nokogiri::HTML(open("https://app.roll20.net/lfg/search/"))

        meetups = doc.css("tr.lfglisting")
        meetups.each do |m|
            name = m.css("a.lfglistingname").text
            game_url = m.css("a.lfglistingname").attribute("href").text
            DNDMeetups::Meetup.new(name, game_url)
        end
    end

    def self.scrape_game_info
        #doc_nest = Nokogiri::HTML(open("https://app.roll20.net#{game_url}"))
        #game = doc_nest.css("class.lfgtable")
        #game.each do |g|
        #    game_type = ("span.playinggame").text
        #    next_game = ("span.nextgame").text
        #end
    end
end