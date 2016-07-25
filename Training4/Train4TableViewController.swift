//
//  Train4TableViewController.swift
//  Training4
//
//  Created by dinh trong thang on 7/18/16.
//  Copyright © 2016 dinh trong thang. All rights reserved.
//

import UIKit

class Train4TableViewController: UITableViewController {
    //khoi tao du lieu dau vao
    var avResultArray = [AVResult]()
    var editClick : Bool = false
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        for _ in 1...30 {
            let avObject = AVResult()
            avObject.avValue = Float(random()%10)*1.1
            avObject.loviValue = random()%255
            avResultArray.append(avObject)
        }
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return avResultArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! T4TableViewCell

        // Configure the cell...
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.timeStyle = .ShortStyle
        cell.t4Date.text = dateFormatter.stringFromDate(avResultArray[indexPath.row].captureDate)
        cell.t4avValue.text = "AV " + String(avResultArray[indexPath.row].avValue)
        cell.t4avValue.textColor = UIColor.redColor()
        cell.t4loviValue.text = "色度 " + String(avResultArray[indexPath.row].loviValue)
        cell.t4ImageView.image = UIImage(named: "restaurant")
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editClick == true {
            if editingStyle == .Delete {
                // Delete the row from the data source
                avResultArray.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                
            } else if editingStyle == .Insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            }
        }
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        let itemToMove = avResultArray[fromIndexPath.row]
        avResultArray.removeAtIndex(fromIndexPath.row)
        avResultArray.insert(itemToMove, atIndex: toIndexPath.row)
    }


  
    // Override to support conditional rearranging of the table view.
//    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func editAction(sender: AnyObject) {
        if editClick == false {
            editClick = true
            editButton.title = "Cancel"
        }
        else {
            editClick = false
            editButton.title = "Edit"
        }
        
    }
}
