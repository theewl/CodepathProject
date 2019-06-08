//
//  ToDoViewController.swift
//  example_project
//
//  Created by Yuhui Chen on 6/7/19.
//  Copyright © 2019 theEWL. All rights reserved.
//

import UIKit
import Parse

class ToDoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var allEvents = [PFObject]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 70;
        tableView.dataSource = self
        tableView.delegate = self
        
        let query = PFQuery(className: "Event")
        
        query.findObjectsInBackground { (posts, error) in
            if posts != nil
            {
                self.allEvents = posts!
                self.tableView.reloadData()
            }
        }
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell") as! eventCell
        let event = allEvents[indexPath.row]
        cell.title.text = event["title"] as? String
        cell.deadline.text = event["due"] as? String
        return cell
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
