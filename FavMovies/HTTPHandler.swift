//
//  HTTPHandler.swift
//  FavMovies
//
//  Created by Jagadeesh Bandlamudi on 2/26/19.
//  Copyright © 2019 Jagadeesh Bandlamudi. All rights reserved.
//

import Foundation
class HTTPHandler {
    static func getJson(urlString: String, completionHandler: @escaping(Data?) -> Void){
        let urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlString!)
        print("URL being used is \(url!)")
        let session = URLSession.shared
        let task = session.dataTask(with: url!){ data, response, error in
            if let data = data {
                let httpResponse = response as! HTTPURLResponse
                let statusCode=httpResponse.statusCode
                print("Request completed with code: \(statusCode)")
                if(statusCode==200){
                    print("Return to completion handler with data")
                    completionHandler(data as Data)
                }
            }else if let error = error{
                    print("***There was an error making HTTP Request**")
                    print(error.localizedDescription)
                    completionHandler(nil)
                }
            }
        task.resume()
        }
    
}

