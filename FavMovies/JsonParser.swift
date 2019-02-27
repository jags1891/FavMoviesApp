//
//  JsonParser.swift
//  FavMovies
//
//  Created by Jagadeesh Bandlamudi on 2/26/19.
//  Copyright © 2019 Jagadeesh Bandlamudi. All rights reserved.
//

import Foundation
class JSONParser {
    static func parse(data:Data)->[String:AnyObject]?{
        let options = JSONSerialization.ReadingOptions()
        do{
            let json = try JSONSerialization.jsonObject(with: data, options: options) as? [String:AnyObject]
            return json!
        }catch(let parseError){
            print("There was an error in parsing JSON: \(parseError.localizedDescription)**")
        }
        return nil
    }
}
