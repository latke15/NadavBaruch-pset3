//
//  SecondViewController.swift
//  NadavBaruch-pset3
//
//  Created by Nadav Baruch on 14-11-16.
//  Copyright © 2016 Nadav Baruch. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var movieInfo: UILabel!
    var movieData = String()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        movieInfo.text = movieData
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
