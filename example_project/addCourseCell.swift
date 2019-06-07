//
//  addCourseCell.swift
//  example_project
//
//  Created by Eric Liang on 5/31/19.
//  Copyright © 2019 theEWL. All rights reserved.
//

import UIKit
import Parse

class addCourseCell: UITableViewCell {

    
    
    @IBOutlet weak var courseName: UILabel!
    
    @IBOutlet weak var courseSelected: UISwitch!
    var course: PFObject?
    
    @IBAction func onSwitch(_ sender: Any) {
        let user = PFUser.current()
        if courseSelected.isOn {
            user?.add(course, forKey: "courses")
        }
        else {
            user?.remove(course, forKey: "courses")
        }
    }
}
