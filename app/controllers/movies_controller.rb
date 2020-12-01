class MoviesController < ApplicationController
    def index
        movies = Movie.topMovies()
        render json: movies["results"]
    end
    
    def search_movies
         data = Movie.getMovies(search_params)
        render json: data["results"]
    end

    def update
        byebug
    end


    private

    def search_params
        params.permit(:search_term)
    end
end

