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
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
    if @movie.user != current_user
      return render :text => "Edit not allowed.", :status => :forbidden
    end
  end

  def update
    @movie = Movie.find(params[:id])
  end

  def destroy
    @movie = Movie.find(params[:id])
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