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
        puts "Here is a list of thirty upcoming games. Pick one to see more:"
        @games.each.with_index(1) do |meetup, i|
            puts "#{i}. #{meetup.name}"
        end
    end

    def get_picked_game
        picked_game = gets.strip.to_i
        display_picked_game(picked_game) if valid_input(picked_game, @games)
    end

    def valid_input(input, list)
        input.to_i <= list.length && input.to_i > 0
    end

    def display_picked_game(picked_game)
        game = @games[picked_game - 1]
        puts "#{game.name}"
        puts "Game Type: #{game.game_type}"
        puts "The next game will be #{game.next_game}"
        #puts "The game needs #{game.players_needed} players."
        #puts "This game is played #{game.frequency}."
        #puts "This game uses #{game.audio_visual} to play."
        #puts "Language: #{game.language}"
        #puts "Are new players welcome? #{game.new_players}"
        #puts "Is mature content allowed in this game? #{game.mature_content}"
        #puts "How much does it cost to play this game? #{game.pay_to_play}"
        #puts "Is this a pick up game? #{game.pick_up_game}"
    end

    def next_move
        puts "Need to see another game? Type 'exit' to quit or hit any key to see the game list again."
        @input = gets.strip
    end

    def goodbye
        puts "See you next week for more adventures!"
    end
end