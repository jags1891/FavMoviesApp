//
//  SearchViewController.swift
//  FavMovies
//
//  Created by Jagadeesh Bandlamudi on 2/25/19.
//  Copyright © 2019 Jagadeesh Bandlamudi. All rights reserved.
//

import UIKit
import SystemConfiguration

class SearchViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate  {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchTxt:UITextField!
    var searchResults :[Movie]=[]
    var apiKey:String = Config.apiKey
    weak var delegate:ViewController!
    
    @IBAction func search(sender: UIButton){
        print("Searchin....")
        var searchTerm = searchTxt.text!
        if(searchTerm.characters.count>2){
            retrieveMoviesByTerm(searchTerm:searchTerm)
        }
    }
    
    @IBAction func addFav(sender:UIButton){
        print("The item #\(sender.tag) was selected")
        self.delegate.favMovies.append(searchResults[sender.tag])
    }
    
    
    
    func retrieveMoviesByTerm(searchTerm:String){
        let url="https://www.omdbapi.com/?apikey=\(apiKey)&s=\(searchTerm)&type=movie&r=json"
        HTTPHandler.getJson(urlString: url, completionHandler: parseDataIntoMovies)
    }
    
    func parseDataIntoMovies(data: Data?) ->Void {
        if let data = data {
            let object = JSONParser.parse(data: data)
            if let object = object {
                self.searchResults = MovieDataProcessor.mapJsonToMovies(object: object, moviesKey: "Search")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Search Results"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //grouped virtical sections of the table view
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100.0;//Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // at init/appear .. this runs for each visible cell that needs to render
        let movieCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell",
                                                      for: indexPath) as! CustomTableViewCell
        let idx:Int = indexPath.row
        movieCell.favButton.tag=idx
        movieCell.movieTitle?.text=searchResults[idx].title
        movieCell.movieYear?.text=searchResults[idx].year
        displayMovieImage(index:idx, movieCell:movieCell)
        return movieCell
        
    }
    
    func displayMovieImage(index:Int, movieCell: CustomTableViewCell) {
        
        let url : String=(URL(string: searchResults[index].imageURL)?.absoluteString)!
        
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler:{
            (data, response, error) -> Void  in
            if error != nil{
                print (error!)
                return
            }
            
            DispatchQueue.main.async(execute: {
                let image = UIImage(data: data!)
                movieCell.movieImageView?.image = image
            })
            
        }).resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchTxt.delegate=self
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
