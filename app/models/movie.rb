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
        
        search ={
            api_key: "#{ENV["TMBD_API_KEY"]}",
            language: "en-US",
            append_to_response: "credits"
        }
        
        movie_info = RestClient.get("https://api.themoviedb.org/3/movie/#{id.to_i}", {
            params: search
        })
        movie = JSON.parse(movie_info)
        movie_parse(movie)
    end

 

    def self.movie_parse(movObj)
        director = get_director(movObj)
        movie_info = {
            movieId: movObj["id"],
            title: movObj["original_title"],
            director: director,
            release_date: movObj["release_date"].split("-")[0],
            description: movObj["overview"],
            poster: movObj["poster_path"],
        }
    end

    def self.get_director(obj)
        cast = obj["credits"]["crew"]
        director = cast.find do |crew_mem|
            crew_mem["job"] == "Director"
        end["name"]
        director
    end

    
end
