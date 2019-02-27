//
//  ViewController.swift
//  FavMovies
//
//  Created by Jagadeesh Bandlamudi on 2/25/19.
//  Copyright © 2019 Jagadeesh Bandlamudi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var favMovies: [Movie] = []
    @IBOutlet var mainTableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="searchMoviesSegue"{
            let controller = segue.destination as! SearchViewController
            controller.delegate = self;
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("FavMovie.Count=\(favMovies.count)")
        return favMovies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0;//Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell",
        for: indexPath) as! CustomTableViewCell
        
        let idx:Int = indexPath.row
        movieCell.movieTitle?.text=favMovies[idx].title
        movieCell.movieYear?.text=favMovies[idx].year
       
        displayMovieImage(index:idx, movieCell:movieCell)
        return movieCell
    }
    
    func displayMovieImage(index:Int, movieCell: CustomTableViewCell) {
        
        let url : String=(URL(string: favMovies[index].imageURL)?.absoluteString)!
        
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
    
    override func viewWillAppear(_ animated: Bool) {
       mainTableView.reloadData()
        /*
        if(favMovies.count==0){
            favMovies.append(Movie(id: "1", title: "Spider Man", year: "1981", imageURL: "https://pngimg.com/   uploads/spider_man/spider_man_PNG97.png"))
        }*/
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

