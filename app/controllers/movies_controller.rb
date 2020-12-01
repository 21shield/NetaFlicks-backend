class MoviesController < ApplicationController
    def index
        movies = Movie.topMovies()
        render json: movies["results"]
    end
    
    def search_movies
         data = Movie.getMovies(search_params)
        render json: data["results"]
    end

    def updateMovie
         movie = Movie.findMovie(updateMovie_params[:id])
         byebug

        #  get info back from  api
        # create movie/ update
        # return that movie with updated counts
    end


    private
    def updateMovie_params
        params.permit(:id, :value)
    end

    def search_params
        params.permit(:search_term)
    end
end

