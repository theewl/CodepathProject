//
//  CommentsViewController.swift
//  example_project
//
//  Created by Yuhui Chen on 6/7/19.
//  Copyright © 2019 theEWL. All rights reserved.
//

import UIKit
import Parse

class CommentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var course: PFObject?
    var courseComments = [PFObject]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(courseComments)
        return courseComments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell") as! CommentCell
        let comment = courseComments[indexPath.row]
        var user: PFUser?
        user = comment["author"] as? PFUser
        cell.userName.text = user?["username"] as? String
        cell.commentText.text = comment["text"] as? String
        return cell
    }

    override func viewDidAppear(_ animated: Bool) {
        var comments = [PFObject]()
        if (course != nil) && (course?["comments"] != nil) {
            comments = course?["comments"] as! [PFObject]
            
            if comments != [] {
                for comment in comments{
                    let query = PFQuery(className: "Comment")
                    query.includeKey("author")
                    query.includeKey("text")
                    query.whereKey("objectId", equalTo: comment.objectId!)
                    
                    query.findObjectsInBackground { (comment, error) in
                        if error != nil
                        {
                            print(error!.localizedDescription)
                        } else {
                            let comment = comment![0]
                            self.courseComments.append(comment)
                            self.tableView.reloadData()
                        }
                    }
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
