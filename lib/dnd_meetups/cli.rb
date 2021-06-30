class DNDMeetups::CLI
    
    def call
        DNDMeetups::Scraper.scrape_games_list
        puts "Welcome to your next online Dungeons & Dragons adventure!"
        list_games
        menu
    end

    def get_games
        @games = DNDMeetups::Meetup.all
    end

    def list_games
        puts "Here is a list of thirty upcoming games:"
        @games.each.with_index(1) do |meetup, i|
            puts "#{i}. #{meetup.name}"
        end
    end

    def list_game_info(game)
        puts "#{game.name}"
        puts "Game Type: #{game.game_type}"
        puts "The next game will be on #{game.next_game}"
        #puts "The game needs #{game.players_needed} players."
        #puts "This game is played #{game.frequency}."
        #puts "This game uses #{game.audio_visual} to play."
        #puts "Language: #{game.language}"
        #puts "Are new players welcome? #{game.new_players}"
        #puts "Is mature content allowed in this game? #{game.mature_content}"
        #puts "How much does it cost to play this game? #{game.pay_to_play}"
        #puts "Is this a pick up game? #{game.pick_up_game}"
    end

    def menu  
        input = nil
        puts "Which game would you like more info on? Or type list to see the games again. Or type exit to exit:"
        while input != "exit"
            input = gets.strip.downcase

            if input.to_i > 0
                the_meetup = @games[input.to_i-1]
                list_game_info
            elsif input == "list"
                list_meetups
            else
                puts "That didn't work. Type list or exit."                 
            end
        end
        goodbye
    end

    def goodbye
        puts "See you next week for more adventure!"
    end
end