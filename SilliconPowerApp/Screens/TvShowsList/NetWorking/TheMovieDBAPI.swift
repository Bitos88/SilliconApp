//
//  ApiResponse.swift
//  SilliconPowerApp
//
//  Created by Alberto Alegre Bravo on 24/2/22.
//

import Foundation

class TheMovieDBAPI {
            
    var index = 1
    //let baseURL = URL(string: "https://api.themoviedb.org/3/tv/popular?api_key=c6aeee577586ba38e487b74dfede5deb&language=en-US&page=\(index)")
    
    
    func getTvShows(completion: @escaping ([TvShow]) -> Void){
        if let url = URL(string: "https://api.themoviedb.org/3/tv/popular?api_key=c6aeee577586ba38e487b74dfede5deb&language=en-US&page=\(index)") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    self.parseJson(data: data, completion: completion)
                }
            }.resume()
        }
    }
    
}

extension TheMovieDBAPI {
    
    private func parseJson(data: Data, completion: @escaping ([TvShow]) -> Void) {
        do {
            let tvShows = try JSONDecoder().decode(TvShowsListModel.self, from: data)
            let movie = tvShows.results
            DispatchQueue.main.async {
                completion(movie)
            }
            
        } catch let decodingError {
            print(decodingError)
        }
    }
    
}
