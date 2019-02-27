//
//  MovieDataProcessor.swift
//  FavMovies
//
//  Created by Jagadeesh Bandlamudi on 2/26/19.
//  Copyright © 2019 Jagadeesh Bandlamudi. All rights reserved.
//

import Foundation
class MovieDataProcessor {
    static func mapJsonToMovies(object: [String: AnyObject], moviesKey: String) -> [Movie]
    {
            var mappedMovies: [Movie]=[]
            
            guard let movies = object[moviesKey] as? [[String: AnyObject]] else{
                return mappedMovies
            }
            for movie in movies{
                guard let id = movie["imdbID"] as? String,
                let name = movie["Title"] as? String,
                let year = movie["Year"] as? String,
                let imageURL = movie["Poster"] as? String else {continue}
                
                let movieClass = Movie(id:id, title:name, year:year, imageURL: imageURL )
                mappedMovies.append(movieClass)
            }
        
            return mappedMovies
    }
    
    static func write(movies:[Movie]){
        
    }
   

}
