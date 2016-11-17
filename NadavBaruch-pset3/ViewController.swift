//
//  ViewController.swift
//  NadavBaruch-pset3
//
//  Created by Nadav Baruch on 14-11-16.
//  Copyright © 2016 Nadav Baruch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var results = [movies]()
    var result:movies?
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
    
    func showAlertView(title: String, withDescription description: String, buttonText text: String) {
        
        let alertController = UIAlertController(title: title, message: description, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: text, style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func movieButton(_ sender: Any) {
        if movieInput.text == "" {
            showAlertView(title: "Attention!", withDescription: "You forgot your input!", buttonText: "Understood!")
        }
        let urlInput = movieInput.text
        let newUrlInput = urlInput?.replacingOccurrences(of: " ", with: "+")
    
        
        let url = URL(string: "https://www.omdbapi.com/?t=" + newUrlInput! + "&y=&plot=short&r=json")
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                self.showAlertView(title:"Attention!", withDescription:"Error occured!", buttonText:"Understood!")
                print("error!")
                return
            }
            guard let data = data else {
                self.showAlertView(title:"Attention!", withDescription:"No data could be found!", buttonText:"Understood!")
                print("Data is empty")
                return
            }
            
            
            // Get status code
            let httpResponse = response as! HTTPURLResponse
            if httpResponse.statusCode == 400{
                self.showAlertView(title:"Attention!", withDescription:"Bad request, please contact the administrator.", buttonText:"Understood!")
            }
            if httpResponse.statusCode == 500{
                self.showAlertView(title:"Attention!", withDescription:"Internal server error, please contact the administrator.", buttonText:"Understood!")
            }
            
            
            let myJson = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            print(myJson!)
            print(myJson!["Actors"] as Any)
            }
        task.resume()
        }
    
    // segue contents to the rawtext variable in the the next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination: SecondViewController = (segue.destination as? SecondViewController){
            destination.movieData = myJson
            //let destination0: TableViewController = (segue.destination as? TableViewController)!
                //destination0.data = myJson
        }
    }}
