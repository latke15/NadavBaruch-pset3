//
//  ViewController.swift
//  NadavBaruch-pset3
//
//  Created by Nadav Baruch on 14-11-16.
//  Copyright © 2016 Nadav Baruch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var introText: UITextView!
    var result:movies?
    @IBOutlet weak var movieInput: UITextField!
    
    let myJson = String()
    var newUrlInput = String()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        introText.isEditable = false
    }
    // Show an alert
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
            
            if httpResponse.statusCode == 200{
                print("Succeed to maintain data!")
            }

            
            let dict = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            
            // kan het zijn dat het hier misgaat? Dat deze steeds opnieuw geinitialiseerd wordt?
            let movie = parse(dict: dict!) as? movies
            
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "secondVCID", sender: movie!)
            }
            
        }
        task.resume()
        self.loadView()
    }
    
    // segue contents to the rawtext variable in the the next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // check if we go to 2nd VC
        if segue.identifier == "secondVCID" {
            if let destination = segue.destination as? SecondViewController {
                destination.result = sender as? movies
            }
        }
        
        else if segue.identifier == "ThirdVCID" {
            if let destination = segue.destination as? TableViewController {
                destination.result = sender as? movies
            }
        }
        
    }}
