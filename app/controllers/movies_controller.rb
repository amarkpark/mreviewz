class MoviesController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    current_user.movies.create(movie_params)
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :release_year, :rating, :review)
  end

end

# :name
# :release_year 
# :rating 
# :review 