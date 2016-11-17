//
//  MovieCellTableViewCell.swift
//  NadavBaruch-pset3
//
//  Created by Nadav Baruch on 15-11-16.
//  Copyright © 2016 Nadav Baruch. All rights reserved.
//

import UIKit

class MovieCellTableViewCell: UITableViewCell {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var image1: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
