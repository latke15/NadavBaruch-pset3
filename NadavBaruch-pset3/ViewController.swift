//
//  ViewController.swift
//  NadavBaruch-pset3
//
//  Created by Nadav Baruch on 14-11-16.
//  Copyright © 2016 Nadav Baruch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var movieInput: UITextField!
    @IBOutlet weak var movieButton: UIButton!
    @IBOutlet weak var tableButton: UIButton!
    let myJson = String()
    var newUrlInput = String()

   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    
    func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    }
    @IBAction func movieButton(_ sender: Any) {
        let urlInput = movieInput.text
        let newUrlInput = urlInput?.replacingOccurrences(of: " ", with: "+")
        
        let url = URL(string: "https://www.omdbapi.com/?t=" + newUrlInput! + "&y=&plot=short&r=json")
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                print("error!")
                return
            }
            guard let data = data else {
                print("Data is empty")
                return
            }
            let myJson = try! JSONSerialization.jsonObject(with: data, options: [])
            print(myJson)
        }
        task.resume()
    }
    
    // segue contents to the rawtext variable in the the next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination: SecondViewController = (segue.destination as? SecondViewController){
            destination.movieData = myJson}
    }}
