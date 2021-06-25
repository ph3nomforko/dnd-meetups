class DNDMeetups::CLI
    
    def call
        list_meetups
        menu
        goodbye
    end

    def list_meetups
        @meetups = DNDMeetups::Meetup.today
        @meetups.each.with_index(1) do |meetup, i|
            puts "#{i}. #{meetup.name} - #{meetup.location} at #{meetup.time}"
        end
    end

    def menu  
        input = nil
        puts "Put the number of the meeutp you'd like more info on or type list to see the meetups again type exit to exit:"
        while input !="exit"
            input = gets.strip.downcase

            if input.to_i > 0
                the_meetup = @meetups[input.to_i-1]
                puts "#{i}. #{the_meetup.name} - #{the_meetup.location} at #{the_meetup.time}"
            elsif input == "list"
                list_meetups
            else
                puts "That didn't work. Type list or exit."                 
            end
        end
    end

    def goodbye
        puts "See you next week for more adventure!"
    end
end