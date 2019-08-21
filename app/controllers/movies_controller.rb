class MoviesController < ApplicationController
  before_action :authenticate_user!

  def new
    @movie = Movie.new
  end

  def create
    @movie = current_user.movies.new(movie_params)

    if @movie.save
      flash[:success] = 'You have been shared a movie!'
      redirect_to root_path
    else
      flash[:error] = 'Could not share the movie!'
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie)
          .permit(:title, :description, :youtube_url)
  end
end
