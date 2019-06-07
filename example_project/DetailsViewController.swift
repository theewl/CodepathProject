//
//  DetailsViewController.swift
//  example_project
//
//  Created by Yuhui Chen on 6/6/19.
//  Copyright © 2019 theEWL. All rights reserved.
//

import UIKit
import Parse

class DetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var course: PFObject?
    var courseComments = [PFObject]()
    @IBOutlet weak var tableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        var comments = [PFObject]()
        comments = course?["comments"] as! [PFObject]
        
        if comments != [] {
            for comment in comments{
                let query = PFQuery(className: "Comment")
                query.includeKey("author")
                query.whereKey("objectId", equalTo: comment.objectId!)
                
                query.findObjectsInBackground { (comment, error) in
                    if error != nil
                    {
                        print(error!.localizedDescription)
                    } else {
                        let comment = comment![0]
                        self.courseComments.append(comment)
                        //                        print(course)
                        //                        print(self.userCourses.contains(course))
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailsViewTimeLocCell") as! detailsViewTimeLocCell
            cell.title.text = (course!["name"] as? String) ?? ""
            cell.disTimeLoc.text = ("\((course?["disTime"] as? String) ?? "N")|\((course?["disPos"] as? String) ?? "A")")
            cell.labTimeLoc.text = ("\((course?["labTime"] as? String) ?? "N")|\((course?["labPos"] as? String) ?? "A")")
            cell.lecTimeLoc.text = ("\((course?["lecTime"] as? String) ?? "N")|\((course?["lecPos"] as? String) ?? "A")")
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailsViewActivityCell") as! detailsViewActivityCell
            cell.activity1.text = "HW5"
            cell.Deadline1.text = "Monday"
            cell.activity2.text = "ReviewSession"
            cell.Deadline2.text = "Tuesday"
            cell.activity3.text = "Final"
            cell.Deadline3.text = "Friday"
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailsViewCommentsCell") as! detailsViewCommentsCell
            var commentNum = courseComments.count
            
            var user: PFUser
            if commentNum > 0 {
                user = (courseComments[0]["author"] as? PFUser)!
                cell.user1.text = user["username"] as? String
                cell.comment1.text = courseComments[0]["text"] as? String
                commentNum -= 1;
            }
            if commentNum > 0 {
                user = (courseComments[1]["author"] as? PFUser)!
                cell.user2.text = user["username"] as? String
                cell.comment2.text = courseComments[1]["text"] as? String
                commentNum -= 1;
            }
            if commentNum > 0 {
                user = (courseComments[2]["author"] as? PFUser)!
                cell.user3.text = user["username"] as? String
                cell.comment3.text = courseComments[2]["text"] as? String
                commentNum -= 1;
            }
            return cell
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
