//
//  CommentCell.swift
//  example_project
//
//  Created by Yuhui Chen on 6/7/19.
//  Copyright © 2019 theEWL. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var commentText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
