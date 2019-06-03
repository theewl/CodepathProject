//
//  CourseCell.swift
//  example_project
//
//  Created by Eric Liang on 5/31/19.
//  Copyright © 2019 theEWL. All rights reserved.
//

import UIKit

class CourseCell: UITableViewCell
{

    @IBOutlet weak var courseName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
