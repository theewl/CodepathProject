//
//  AddCommentViewController.swift
//  example_project
//
//  Created by Yuhui Chen on 6/7/19.
//  Copyright © 2019 theEWL. All rights reserved.
//

import UIKit
import Parse

class AddCommentViewController: UIViewController {
    @IBOutlet weak var userIpt: UITextView!
    var course: PFObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onPost(_ sender: Any) {
        let comment = PFObject(className: "Comment")
        comment["author"] = PFUser.current()
        comment["text"] = userIpt.text
        comment["course"] = course
        if course != nil {
            course?.add(comment, forKey: "comments")
            course?.saveInBackground{ (success, error) in
                if success {
                    print("saved!")
                    self.navigationController?.popViewController(animated: true)
                }
                else {
                    print("\(error)")
                }
            }
        }
    }
    
   
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
