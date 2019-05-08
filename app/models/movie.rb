class Movie < ActiveRecord::Base

    def self.ordered(field)
        case field
        when 'title'
            Movie.order(title: :asc)
        when 'release_date'
            Movie.order(release_date: :desc)
        else
            Movie.all
        end
    end

end
