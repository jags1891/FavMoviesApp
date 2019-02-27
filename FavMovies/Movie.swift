//
//  Movie.swift
//  FavMovies
//
//  Created by Jagadeesh Bandlamudi on 2/25/19.
//  Copyright © 2019 Jagadeesh Bandlamudi. All rights reserved.
//

import Foundation

class Movie{
    var id: String=""
    var title: String=""
    var year: String=""
    var imageURL: String=""
    var plot: String=""

    init(id:String, title:String, year:String, imageURL:String, plot:String="") {
         self.id=id
         self.title=title
         self.year=year
         self.imageURL=imageURL
         self.plot=plot
    }
    
}
