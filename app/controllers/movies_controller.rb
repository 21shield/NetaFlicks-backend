class MoviesController < ApplicationController
    def index
        movies = Movie.topMovies()
        render json: movies["results"]
    end

    def show

        movie = Movie.find_by(movieId: movie_params["id"] )
        if movie
            render json: {movie: MovieSerializer.new(movie)}

        else
            movieApi = Movie.findMovie(movie_params[:id])
            render json: {movie: movieApi}
        end
    end
    
    def search_movies
         data = Movie.getMovies(movie_params)
        render json: data["results"]
    end

    def update

        movie = Movie.findMovie(movie_params[:id])
        update_mov = Movie.find_or_create_by(movie)

        if !!update_mov
            movie_params[:value] ? (update_mov.thumbs_up +=1) : (update_mov.thumbs_down += 1)
            update_mov.save
            render json: {movie: MovieSerializer.new(update_mov)}
        else
            render json: {error: "Unable to find movie in the database." }, status: :bad_request
        end 
    
    end


    private

    def movie_params
        params.permit(:search_term, :id, :value, movie:[:id])
    end

end

