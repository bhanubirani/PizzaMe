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
    var lvmArray: NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Near You"
        
        lvmArray = NSMutableArray()
        let downloadM: LocationDownloadManager = LocationDownloadManager();
        downloadM.downloadData { (result, error) -> Void in
            self.lvmArray = result as? NSMutableArray
            
            dispatch_async(dispatch_get_main_queue(), {
                self.table.reloadData()
            })

        };
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table View Delegate Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (lvmArray?.count)!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("default_cell")! as UITableViewCell ;
        
        let local: LocationViewModel = (lvmArray?.objectAtIndex(indexPath.row))! as! LocationViewModel
        
        let titleL : UILabel! = cell.viewWithTag(1001) as! UILabel;
        titleL.text = local.title;
        
        let addressL : UILabel! = cell.viewWithTag(1002) as! UILabel;
        addressL.text = local.address;
        
        let phoneL : UILabel! = cell.viewWithTag(1003) as! UILabel;
        phoneL.text = local.phone;
        
        return cell;
    }
}

