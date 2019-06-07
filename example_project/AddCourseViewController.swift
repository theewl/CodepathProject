//
//  AddCourseViewController.swift
//  example_project
//
//  Created by Eric Liang on 5/31/19.
//  Copyright © 2019 theEWL. All rights reserved.
//

import UIKit
import Parse

class AddCourseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    let user = PFUser.current()!
    var allCourses = [PFObject]()
    var userCourses = [PFObject]()
    let bgColors = [UIColor(displayP3Red: 85/255, green: 85/255, blue: 85/255, alpha: 1),
                    UIColor(displayP3Red: 110/255, green: 110/255, blue: 110/255, alpha: 1),
                    UIColor(displayP3Red: 135/255, green: 135/255, blue: 135/255, alpha: 1)] as [UIColor]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return allCourses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addCourseCell") as! addCourseCell
        let course = allCourses[indexPath.row]
    
        cell.courseName.text = course["name"] as? String
        cell.course = (course as? PFObject)!
        cell.backgroundColor = bgColors[indexPath.row % 3]
        cell.courseSelected.isOn = false
        for temp in userCourses{
            
            if temp["name"] as! String == course["name"] as! String{
                cell.courseSelected.isOn = true
                break
            }
        }
        

        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        userCourses.removeAll()
        var courses = [PFObject]()
        
        if user["courses"] != nil {
            courses = user["courses"] as! [PFObject]
            if courses != [] {
                for course in courses{
                    let query = PFQuery(className: "courseNames")
                    query.whereKey("objectId", equalTo: course.objectId!)
                    
                    query.findObjectsInBackground { (course, error) in
                        if error != nil
                        {
                            print(error!.localizedDescription)
                        } else {
                            let course = course![0]
                            self.userCourses.append(course)
                            //print(course)
                            //                        print(self.userCourses.contains(course))
                            self.tableView.reloadData()
                        }
                    }
                }
            }
        }
        

        let query2 = PFQuery(className: "courseNames" )
        
        query2.findObjectsInBackground { (posts, error) in
            if posts != nil
            {
                self.allCourses = posts!
                self.tableView.reloadData()
            }
        }
    }
    

    
//    override func viewDidDisappear(_ animated: Bool) {
//        user["courses"] = userCourses
//        user.saveInBackground { (success, error) in
//            if success {
//                print("saved")
//            }
//            else {
//                print(error)
//            }
//        }
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
