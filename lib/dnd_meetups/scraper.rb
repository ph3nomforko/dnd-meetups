class DNDMeetups::Scraper

    def self.scrape_games_list
        doc = Nokogiri::HTML(open("https://app.roll20.net/lfg/search/"))

        meetups = doc.css("div.campaigns")
        meetups.each do |m|
            name = g.css("a.lfglistingname").text
            game_url = g.css("a.lfglistingname").attribute("href").text
            doc_nest = Nokogiri::HTML(open("https://app.roll20.net#{game_url}"))
            game = doc_nest("class.lfgtable")
            game.each do |g|
                game_typs = ("span.playinggame").text
                next_game = ("span.nextgame").text
            end
            DNDMeetups::Meetup.new(name, game_url)
        end
    end