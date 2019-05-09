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

    def self.ratings
        Movie.select('DISTINCT rating').map(&:rating)
    end

    def self.selected_ratings(ratings, field)
        if ratings.length == 0
            Movie.all
        else
            Movie.where({ rating: ratings }).ordered(field)
        end
    end
end
