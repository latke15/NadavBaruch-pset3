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
    var movieTitles : [String] = []


    @IBOutlet weak var movieTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTitles = UserDefaults.standard.array(forKey: "titles") as! [String]
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
        return movieTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.movieTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCellTableViewCell
        
        cell.movieTitle.text = movieTitles[indexPath.row] as String?
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            movieTitles.remove(at: indexPath.row)
            self.movieTable.reloadData()
        }
    }
    }
