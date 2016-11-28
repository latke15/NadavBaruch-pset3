//
//  TableViewController.swift
//  NadavBaruch-pset3
//
//  Created by Nadav Baruch on 16-11-16.
//  Copyright © 2016 Nadav Baruch. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var result: movies?
    var movieTitles : [String]?
    var movieRatings : [String]?
    var moviePosters : [String]?
    var newUrlInput : [String]?


    @IBOutlet weak var movieTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTitles = UserDefaults.standard.array(forKey: "titles") as? [String]
        movieRatings = UserDefaults.standard.array(forKey: "ratings") as? [String]
        moviePosters = UserDefaults.standard.array(forKey: "posters") as? [String]
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieTitles!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.movieTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCellTableViewCell
        
        cell.movieTitle.text = movieTitles?[indexPath.row] as String?
        cell.imdbRating.text = movieRatings?[indexPath.row] as String?
        
        // download the image for the movie
        // source: http://stackoverflow.com/questions/24231680/loading-downloading-image-from-url-on-swift
        func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
            URLSession.shared.dataTask(with: url) {
                (data, response, error) in
                completion(data, response, error)
                }.resume()
        }
        func downloadImage(url: URL) {
            print("Download Started")
            getDataFromUrl(url: url) { (data, response, error)  in
                guard let data = data, error == nil else { return }
                print(response?.suggestedFilename ?? url.lastPathComponent)
                print("Download Finished")
                DispatchQueue.main.async() { () -> Void in
                    cell.moviePoster.image = UIImage(data: data)
                }
            }
        }
        
//        let newUrlInput = movieTitles?[indexPath.row] as String?
//        let url = URL(string: "https://www.omdbapi.com/?t=" + newUrlInput! + "&y=&plot=short&r=json")
//        print(moviePosters![indexPath.row])
        if let checkedUrl = URL(string: (moviePosters![indexPath.row])) {
            cell.moviePoster.contentMode = .scaleAspectFit
            downloadImage(url: checkedUrl)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
//            UserDefaults.standard.removeObject(forKey: "titles")
//            UserDefaults.standard.removeObject(forKey: "ratings")
//            UserDefaults.standard.removeObject(forKey: "posters")
            movieTitles!.remove(at: indexPath.row)
            movieRatings!.remove(at: indexPath.row)
            moviePosters!.remove(at: indexPath.row)
            self.movieTable.reloadData()
        }
    }
    }
