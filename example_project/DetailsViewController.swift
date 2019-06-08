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
    var courseEvents = [PFObject]()
    @IBOutlet weak var tableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        courseComments.removeAll()
        courseEvents.removeAll()
        var comments = [PFObject]()
        var events = [PFObject]()
        if (course != nil) {
            if (course?["comments"] != nil) {
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
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
            
            if (course?["events"] != nil) {
                events = course?["events"] as! [PFObject]
                
                if events != [] {
                    for event in events{
                        let query = PFQuery(className: "Event")
                        query.includeKeys(["title", "due"])
                        query.whereKey("objectId", equalTo: event.objectId!)
                        
                        query.findObjectsInBackground { (event, error) in
                            if error != nil
                            {
                                print(error!.localizedDescription)
                            } else {
                                let event = event![0]
                                self.courseEvents.append(event)
                                self.tableView.reloadData()
                            }
                        }
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
            let eventNum = courseEvents.count
            if eventNum >= 3 {
                cell.activity1.text = courseEvents[0]["title"] as? String
                cell.Deadline1.text = courseEvents[0]["due"] as? String
                
                cell.activity2.text = courseEvents[1]["title"] as? String
                cell.Deadline2.text = courseEvents[1]["due"] as? String
                
                cell.activity3.text = courseEvents[2]["title"] as? String
                cell.Deadline3.text = courseEvents[2]["due"] as? String
            } else if eventNum == 2 {
                cell.activity1.text = courseEvents[0]["title"] as? String
                cell.Deadline1.text = courseEvents[0]["due"] as? String
               
                cell.activity2.text = courseEvents[1]["title"] as? String
                cell.Deadline2.text = courseEvents[1]["due"] as? String
                
                cell.activity3.text = ""
                cell.Deadline3.text = ""
            }
            else if eventNum == 1 {
                cell.activity1.text = courseEvents[0]["title"] as? String
                cell.Deadline1.text = courseEvents[0]["due"] as? String
                
                cell.activity2.text = ""
                cell.Deadline2.text = ""
                
                cell.activity3.text = ""
                cell.Deadline3.text = ""
            }
            else {
                cell.activity1.text = ""
                cell.Deadline1.text = ""
                
                cell.activity2.text = ""
                cell.Deadline2.text = ""
                
                cell.activity3.text = ""
                cell.Deadline3.text = ""
            }
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailsViewCommentsCell") as! detailsViewCommentsCell
            var commentNum = courseComments.count
            
            var user: PFUser
            if commentNum >= 3 {
                user = (courseComments[0]["author"] as? PFUser)!
                cell.user1.text = user["username"] as? String
                cell.comment1.text = courseComments[0]["text"] as? String
                
                user = (courseComments[1]["author"] as? PFUser)!
                cell.user2.text = user["username"] as? String
                cell.comment2.text = courseComments[1]["text"] as? String
                
                user = (courseComments[2]["author"] as? PFUser)!
                cell.user3.text = user["username"] as? String
                cell.comment3.text = courseComments[2]["text"] as? String
            } else if commentNum == 2 {
                user = (courseComments[0]["author"] as? PFUser)!
                cell.user2.text = user["username"] as? String
                cell.comment2.text = courseComments[0]["text"] as? String
                
                user = (courseComments[1]["author"] as? PFUser)!
                cell.user2.text = user["username"] as? String
                cell.comment2.text = courseComments[1]["text"] as? String
                
                cell.user3.text = ""
                cell.comment3.text = ""
            }
            else if commentNum == 1 {
                user = (courseComments[0]["author"] as? PFUser)!
                cell.user2.text = user["username"] as? String
                cell.comment2.text = courseComments[0]["text"] as? String
                
                cell.user2.text = ""
                cell.comment2.text = ""
                
                cell.user3.text = ""
                cell.comment3.text = ""
            }
            return cell
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCommentsView" {
            let vc = segue.destination as! CommentsViewController
            vc.course = course
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
