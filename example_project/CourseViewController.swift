//
//  CourseViewController.swift
//  example_project
//
//  Created by Eric Liang on 5/31/19.
//  Copyright © 2019 theEWL. All rights reserved.
//

import UIKit
import Parse

class CourseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    let user = PFUser.current()!
    var userCourses = [PFObject]()
    let bgColors = [UIColor(displayP3Red: 85/255, green: 85/255, blue: 85/255, alpha: 1),
                    UIColor(displayP3Red: 110/255, green: 110/255, blue: 110/255, alpha: 1),
                    UIColor(displayP3Red: 135/255, green: 135/255, blue: 135/255, alpha: 1)] as [UIColor]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return userCourses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell") as! CourseCell
        let course = userCourses[indexPath.row]
        cell.courseName.text = course["name"] as! String
        cell.backgroundColor = bgColors[indexPath.row % 3]
        
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        loadCourseData()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 65

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "loginPage")
        let delegate = UIApplication.shared.delegate as! AppDelegate
        delegate.window?.rootViewController = loginViewController
    }
    
    func loadCourseData() {
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
                            self.tableView.reloadData()
                        }
                    }
                }
            }
        }
        
    }
    
    var sending_course: PFObject?
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sending_course = userCourses[indexPath.row]
        performSegue(withIdentifier: "toDetailsView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsView" {
            let vc = segue.destination as! DetailsViewController
            vc.course = sending_course
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
