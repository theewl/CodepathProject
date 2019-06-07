//
//  detailsViewActivityCell.swift
//  example_project
//
//  Created by Yuhui Chen on 6/7/19.
//  Copyright © 2019 theEWL. All rights reserved.
//

import UIKit

class detailsViewActivityCell: UITableViewCell {
    @IBOutlet weak var activity1: UILabel!
    @IBOutlet weak var activity2: UILabel!
    @IBOutlet weak var activity3: UILabel!
    @IBOutlet weak var Deadline1: UILabel!
    @IBOutlet weak var Deadline2: UILabel!
    @IBOutlet weak var Deadline3: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
