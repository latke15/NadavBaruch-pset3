//
//  SecondViewController.swift
//  NadavBaruch-pset3
//
//  Created by Nadav Baruch on 14-11-16.
//  Copyright © 2016 Nadav Baruch. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var moviePlot: UITextView!
    @IBOutlet weak var imdbRating: UILabel!
    @IBOutlet weak var movieGenre: UITextView!
    @IBOutlet weak var addMovie: UIButton!
    
    var result:movies!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let checkedUrl = URL(string: result.poster) {
            movieImageView.contentMode = .scaleAspectFit
            downloadImage(url: checkedUrl)
        }
        // Do any additional setup after loading the view.\
        movieTitle.text = result.title
        moviePlot.text = result.plot
        movieYear.text = result.year
        movieGenre.text = result.genre
        imdbRating.text = result.imdbRating
        moviePlot.isEditable = false
        movieGenre.isEditable = false
     
    }
    
    
    @IBAction func addMovie(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(movieTitle.text, forKey: "Title")
        var titles = [String]()
        titles.append(movieTitle.text!)
        print(titles)
        defaults.set(titles, forKey: "Movies")
    }
        
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
            self.movieImageView.image = UIImage(data: data)
        }
    }
    }}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
