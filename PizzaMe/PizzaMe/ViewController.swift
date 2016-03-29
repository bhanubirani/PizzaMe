//
//  ViewController.swift
//  PizzaMe
//
//  Created by Bhanu Birani on 29/03/16.
//  Copyright © 2016 Bhanu Birani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Near You"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table View Delegate Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("default_cell")! as UITableViewCell ;
        
        let titleL : UILabel! = cell.viewWithTag(1001) as! UILabel;
        titleL.text = "Dominos Pizza";
        
        let addressL : UILabel! = cell.viewWithTag(1002) as! UILabel;
        addressL.text = "BTM, 16th main, 7th cross";
        
        let phoneL : UILabel! = cell.viewWithTag(1003) as! UILabel;
        phoneL.text = "7411566609";
        
        return cell;
    }
}

