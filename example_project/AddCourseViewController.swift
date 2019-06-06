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
    var courses = [PFObject]()
    var userCourses = [PFObject]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addCourseCell") as! addCourseCell
        let course = courses[indexPath.row]
    
        cell.courseName.text = course["name"] as? String
        
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addCourseCell: addCourseCell!
    
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
        
        let query = PFQuery(className: "courseNames" )
        query.findObjectsInBackground { (posts, error) in
            if posts != nil
            {
                self.courses = posts!
                self.tableView.reloadData()
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
