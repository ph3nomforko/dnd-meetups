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

end