//
//  ViewController.swift
//  ArrowHead
//
//  Created by Denes Csizmadia on 21/03/16.
//  Copyright © 2016 Denes Csizmadia. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        Alamofire.request(.GET, "https://arrowhead.azurewebsites.net") //parameters: ["foo": "bar"])
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
                else {}
        }
        
        
        
        
        
        
        
//        let mapDict = [ "1":"First", "2":"Second"]
//        let json = [ "title":"ABC" , "dict": mapDict ]
//        
//        do {
//            
//            let jsonData = try NSJSONSerialization.dataWithJSONObject(json, options: .PrettyPrinted)
//            
//            // create post request
//            let url = NSURL(string: "https://...appspot.com/_ah/api/activityendpoint/v1/activity")!
//            let request = NSMutableURLRequest(URL: url)
//            request.HTTPMethod = "POST"
//            
//            // insert json data to the request
//            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
//            request.HTTPBody = jsonData
//            
//            
//            let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data, response, error in
//                if error != nil{
//                    print("Error -> \(error)")
//                    return
//                }
//                
//                do {
//                    let result = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? [String:AnyObject]
//                    
//                    print("Result -> \(result)")
//                    
//                } catch {
//                    print("Error -> \(error)")
//                }
//            }
//            
//            task.resume()
//            
//        } catch {
//            print(error)
//        }
    }
   
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

