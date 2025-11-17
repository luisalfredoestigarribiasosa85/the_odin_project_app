class HomeController < ApplicationController
  def index
    @featured_cars = Car.limit(3)
  end
end
