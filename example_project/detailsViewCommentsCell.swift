//
//  detailsViewCommentsCell.swift
//  example_project
//
//  Created by Yuhui Chen on 6/7/19.
//  Copyright © 2019 theEWL. All rights reserved.
//

import UIKit

class detailsViewCommentsCell: UITableViewCell {
    @IBOutlet weak var user1: UILabel!
    @IBOutlet weak var user2: UILabel!
    @IBOutlet weak var user3: UILabel!
    @IBOutlet weak var comment1: UILabel!
    @IBOutlet weak var comment2: UILabel!
    @IBOutlet weak var comment3: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
