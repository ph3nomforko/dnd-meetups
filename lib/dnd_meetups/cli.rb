class DNDMeetups::CLI
    
    def call
        DNDMeetups::Scraper.scrape_games_list
        puts "Welcome to your next online Dungeons & Dragons adventure!"
        @input = ""
        until @input == "exit"
            get_games
            list_games
            get_picked_game
            next_move
        end
        goodbye
    end

    def get_games
        @games = DNDMeetups::Meetup.all
    end

    def list_games
        puts "Here is a list of upcoming games:"
        @games.each.with_index(1) do |meetup, i|
            puts "#{i}. #{meetup.name}"
        end
        puts "Select the number associated with a game to see more info:"
    end

    def get_picked_game
        picked_game = gets.strip.to_i
        if valid_input(picked_game, @games)
            display_picked_game(picked_game)
        else
            list_games
        end
    end

    def valid_input(input, list)
        input.to_i <= list.length && input.to_i > 0
    end

    def display_picked_game(picked_game)
        game = @games[picked_game - 1]
        puts "Title: #{game.name}"
        puts "Game System:         #{game.game_system}."
        puts "Next Game:           #{game.next_game}"
        puts "Players Needed:      #{game.players_needed}"
        puts "Game Type:           #{game.game_type}"
        puts "Game Frequency:      #{game.frequency}"
        puts "Audio/Visual:        #{game.audio_visual}"
        puts "Language:            #{game.language}"
        puts "New Player Friendly? #{game.new_players}"
        puts "Mature Content(18+)? #{game.mature_content}"
        puts "Cost to Play?        #{game.pay_to_play}"
        puts "Pick Up Game?        #{game.pick_up_game}"
        puts "\n#{game.description}"
        puts "\nLink to Game:        https://app.roll20.net#{game.game_url}"
    end

    def next_move
        puts "\nNeed to see another game? Type 'exit' to quit or hit any key to see the game list again."
        @input = gets.strip
    end

    def goodbye
        puts "See you next week for more adventures!"
    end
end