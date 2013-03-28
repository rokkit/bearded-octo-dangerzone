#renders
class RatingRender
  def initialize
  end
end
class StarRender < RatingRender
  def render(rating, template)
    @rating = rating
    @template = template
    @template.content_tag :div, star_image(@rating), :class => "stars"
  end

  private
    def star_image(value)
      @template.image_tag "#{star_type(value)}_star.png",size:'100x100'
    end
    def star_type(value)
      if value == 0
        'empty'
      elsif value < 2
        'half'
      else
        'full'
      end
    end
end
#factories
module RatingFactory
  def create
    raise NotImplementedError, "Abstract factory"
  end
end
class StarRatingFactory
  include RatingFactory
  def create
    StarRender.new
  end
end

#print strategies
class DayPrintWordsStrategy
  def print(number_of_day)
    days = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)
    days[number_of_day]
  end
end

class DayPrinter
  def initialize(strategy)
    @print_strategy = strategy
  end
  def print(number_of_day)
    @print_strategy.print number_of_day
  end
end


module TrainingsHelper
  def render_rating(rating)
    StarRatingFactory.new.create.render rating, self
  end

  def print_day_of_week(number_of_day)
    DayPrinter.new(DayPrintWordsStrategy.new).print number_of_day
  end
end
