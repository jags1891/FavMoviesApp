//
//  Config.swift
//  FavMovies
//
//  Created by Jagadeesh Bandlamudi on 2/26/19.
//  Copyright © 2019 Jagadeesh Bandlamudi. All rights reserved.
//

import Foundation

 class Config{
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()



    static let apiKey: String = {
        guard let apiKey = infoDictionary["API_KEY"] as? String else {
            fatalError("API Key not set in plist for this environment")
        }
        return apiKey
    }()
}
