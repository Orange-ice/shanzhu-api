class HomeController < ApplicationController
  def index
    render json: {
      message: "Welcome! this is created by Ruby."
    }
  end
end
