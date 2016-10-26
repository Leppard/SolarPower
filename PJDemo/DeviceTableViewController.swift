//
//  DeviceTableViewController.swift
//  PJDemo
//
//  Created by apple on 16/1/14.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class DeviceTableViewController: UITableViewController{

    var parseObject : PFObject?
    let deviceTable = ["建筑能耗","光伏发电","建筑能效"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return deviceTable.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! DataTableViewCell
        /*if let pfObject = object{
            cell?.textLabel?.text = pfObject["name"] as? String
        }*/
        cell.titleLabel.text = deviceTable[indexPath.row]
        
        switch indexPath.row{
        case 0: cell.bkImageView.image = UIImage(named: "Home")
        case 1: cell.bkImageView.image =  UIImage(named: "Solar")
        case 2: cell.bkImageView.image =  UIImage(named: "Composition")
        default:break
        }
        

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row{
        case 0: self.performSegueWithIdentifier("consumeSegue", sender: self);
        break;
        case 1: self.performSegueWithIdentifier("generateSegue", sender: self);
        break;
        case 2: self.performSegueWithIdentifier("efficientSegue", sender: self);
        break;
        default:
            break
        }
    }
}
