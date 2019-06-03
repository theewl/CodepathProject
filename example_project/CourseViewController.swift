//
//  CourseViewController.swift
//  example_project
//
//  Created by Eric Liang on 5/31/19.
//  Copyright © 2019 theEWL. All rights reserved.
//

import UIKit

class CourseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    //let list = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell") as! CourseCell
        
        cell.courseName.text = "CS 141"
        
        return cell
    }
    

    @IBOutlet weak var courseCell: UITableViewCell!
    @IBOutlet weak var tableView: UITableView!
    

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
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
