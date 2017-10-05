class MoviesController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  before_action :set_movie, :only => [:show, :edit, :update, :destroy]

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
    if @movie.user != current_user
      return render :text => "Edit not allowed.", :status => :forbidden
    end
  end

  def update
  end

  def destroy
  end

  private
  helper_method :set_movie

  def movie_params
    params.require(:movie).permit(:name, :release_year, :rating, :review)
  end

  def set_movie
    @movie ||= Movie.find(params[:id])
  end

end

# :name
# :release_year 
# :rating 
# :review 