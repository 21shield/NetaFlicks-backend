require 'rest-client'
class Movie < ApplicationRecord
    
    def self.getMovies(str)
        
        search ={
            api_key: "#{ENV["TMBD_API_KEY"]}",
            language: "en-US",
            page: 1,
            query: str[:search_term]
        }

        data = RestClient.get('https://api.themoviedb.org/3/search/movie', {
                params: search
            })
        JSON.parse(data)

    end

    def self.topMovies()
        # if voted up or down save to db
        data = RestClient.get('https://api.themoviedb.org/3/movie/popular', {
            params: {
            api_key: "#{ENV["TMBD_API_KEY"]}",
            language: "en-US",
            page: 1,
        }})
        # byebug

        JSON.parse(data)

    end

    def self.findMovie(id)
        # makes a request to the database to  get info from the specific id to the movie
        # returns this info to be be found/ created
        search ={
            api_key: "#{ENV["TMBD_API_KEY"]}",
            language: "en-US",
            movie_id: id.to_i,
        }
        movie_info = RestClient.get('https://api.themoviedb.org/3/movie/', {
            params: search
        })
        byebug


        JSON.parse(movie_info)
    end

    
end
