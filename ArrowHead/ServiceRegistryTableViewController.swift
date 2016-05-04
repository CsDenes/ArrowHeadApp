//
//  ServiceRegistryTableViewController.swift
//  ArrowHead
//
//  Created by Denes Csizmadia on 20/04/16.
//  Copyright © 2016 Denes Csizmadia. All rights reserved.
//

import UIKit
import Alamofire

class ServiceRegistryTableViewController: UITableViewController {
    
    var Systems = ["System1","System2","System3"]
    var parameters = [
            "systemGroup": "sgDenes",
            "systemName": "sn1",
            "address": "address1",
            "port": 8449,
            "authenticationInfo": "info1"
    ]
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.navigationItem.setRightBarButtonItem(UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "AddSystem"), animated: true)
        
        
//        @IBAction func cancel(sender: AnyObject) {
//            self.dismissViewControllerAnimated(false, completion: nil)
//            println("cancel")
//        }
        
        //WebService()
        PostWebService()
       // SRWebService()
//        


    
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
        return Systems.count
    }
    
    
    func SRWebService() {
        Alamofire.request(.GET, "http://152.66.245.169:8449/api/api/systems") //parameters: ["foo": "bar"])
            .responseJSON { response in
                UIApplication.sharedApplication().networkActivityIndicatorVisible = true
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    // print("JSON: \(JSON[JSON.count-1]["id"])")
                }
        }
    }
    
    func PostWebService() {
    Alamofire.request(.POST, "http://152.66.245.169:8449/api/api/systems", parameters:parameters, encoding: .JSON)
        .response { response in
            print(response)
            print(self.parameters)
        }
    
    
    }
    
    func WebService() {
        let urlPath: String = "http://152.66.245.169:8449/api/api/systems"
        let url: NSURL = NSURL(string: urlPath)!
        let request1: NSURLRequest = NSURLRequest(URL: url)
        let response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        
        
        do{
            
            let dataVal = try NSURLConnection.sendSynchronousRequest(request1, returningResponse: response)
            
            let responseString = NSString(data: dataVal, encoding: NSUTF8StringEncoding)
            //print(responseString)
            do {
                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(dataVal, options: []) as? NSArray {
                    print("Synchronous\(jsonResult)")
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
            
            
        }catch let error as NSError
        {
            print(error.localizedDescription)
        }
    }
    


    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
         cell.textLabel?.text = self.Systems[indexPath.row]
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let VC : SystemTableViewController = segue.destinationViewController as! SystemTableViewController
        VC.selectedItem = tableView.indexPathForSelectedRow!.row
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    func AddSystem() {
        print ("Add System")
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let addSystemViewController = storyBoard.instantiateViewControllerWithIdentifier("AddSystem")
            self.navigationController?.pushViewController(addSystemViewController, animated: true)

    }

    

}
