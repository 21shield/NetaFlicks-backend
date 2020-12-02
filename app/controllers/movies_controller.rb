class MoviesController < ApplicationController
    def index
        movies = Movie.topMovies()
        render json: movies["results"]
    end
    
    def search_movies
         data = Movie.getMovies(movie_params)
        render json: data["results"]
    end

    def create
        movie = Movie.findMovie(movie_params[:id])
        # create movie/ update
        update_mov = Movie.find_or_create_by(movie)
        # return that movie with updated counts
        byebug
        render json: movie
    end


    private
    # def updateMovie_params
    #     params.permit(:id, :value)
    # end

    def movie_params
        params.permit(:search_term, :id, :value, movie:[:id])
    end
end

