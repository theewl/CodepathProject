//
//  detailsViewTimeLocCell.swift
//  example_project
//
//  Created by Yuhui Chen on 6/7/19.
//  Copyright © 2019 theEWL. All rights reserved.
//

import UIKit

class detailsViewTimeLocCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var lecTimeLoc: UILabel!
    @IBOutlet weak var disTimeLoc: UILabel!
    @IBOutlet weak var labTimeLoc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
