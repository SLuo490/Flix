//
//  MovieGridViewController.swift
//  Flix
//
//  Created by Shi Tao Luo on 2/18/21.
//

import UIKit

class MovieGridViewController: UIViewController {

    var movies = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://api.themoviedb.org/3/movie/{movie_id}/similar?api_key=<<api_key>>")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try!
                JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
 
            self.movies = dataDictionary["results"] as! [[String:Any]]
            print(self.movies)
            
            print(self.movies)
        
           }
            
        }
        task.resume()
    
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
