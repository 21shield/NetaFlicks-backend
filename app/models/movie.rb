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
        # request info from db with the imbd id of the movie that was clicked on 
        # if voted up or down save to db
        data = RestClient.get('https://api.themoviedb.org/3/movie/popular', {params: {
            api_key: "#{ENV["TMBD_API_KEY"]}",
            language: "en-US",
            page: 1,
        }})

        JSON.parse(data)

    end

    
end
