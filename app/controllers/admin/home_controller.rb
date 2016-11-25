module Admin
  class HomeController < ApplicationController
    def index
      @top_setters = User.top_setters
    end
  end
end
