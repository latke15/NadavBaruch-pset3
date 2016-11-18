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
    var movies = UserDefaults.standard.value(forKey: "Movies") as? [String] ?? [String]()
    var movieTitle = UserDefaults.standard.value(forKey: "Title")


    @IBOutlet weak var movieTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.movieTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCellTableViewCell
        
        
        cell.movieTitle.text = movieTitle as! String?
    

        return cell
    }
    }
