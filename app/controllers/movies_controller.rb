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
    @movie = current_user.movies.create(movie_params)
    if @movie.valid?
      redirect_to movie_path(@movie)
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def show
  end

  def edit
    if @movie.user != current_user
      return render :text => "Edit not allowed.", :status => :forbidden
    end
  end

  def update
    if @movie.user != current_user
      return render :text => "Update not allowed.", :status => :forbidden
    end
    @movie.update_attributes(movie_params)
    if @movie.valid?
      redirect_to movie_path(@movie)
    else
      render :edit, :status => :unprocessable_entity
    end
  end

  def destroy
    if @movie.user != current_user
      return render :text => "Not allowed to delete this review.", :status => :forbidden
    end
    @movie.destroy
    redirect_to root_path
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :release_year, :rating, :review)
  end

  def set_movie
    @movie ||= Movie.find(params[:id])
  end

end
