class DNDMeetups::Scraper
    def self.scrape_roll_twenty
        doc = Nokogiri::HTML(open(https://app.roll20.net/lfg/search/))

        meetup = self.new
        meetup.name = doc.search("a.lfglistingname").text # Exemplar code
        meetup.time = doc.search("span class.localtime").text
        meetup.game_type = doc.search("td class strong").text
        
        meetup.url = doc.search("a.lfglisting").first.attr("href")

        meetup
    end

    def self.scrape_game_info
        Meetup.game.available_seats = doc.search("span style").text
        meetup.game.description = doc.search("span style description").text
        meetup.game.name = doc.search("a.lfglistingname").text # Exemplar code
        meetup.game.time = doc.search("span class.localtime").text
        meetup.game.game_type = doc.search("td class strong").text
    end
end