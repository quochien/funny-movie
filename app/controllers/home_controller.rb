class HomeController < ApplicationController
  def index
    @movies = Movie.order(created_at: :desc)
                   .paginate(page: params[:page], per_page: 5)
  end
end
