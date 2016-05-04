//
//  Tab1ViewController.swift
//  ArrowHead
//
//  Created by Denes Csizmadia on 09/04/16.
//  Copyright © 2016 Denes Csizmadia. All rights reserved.
//


import UIKit
import Alamofire



var tab1Label = "valami"


class Tab1ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    


    override func viewDidLoad() {
        super.viewDidLoad()

        
        let str = "[{\"names\": [\"Bob\", \"Tim\", \"Tina\"]},{\"names\": [\"Bob\", \"Tim\"]}]"
        let data = str.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
        
        
        
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: [])// as! [String: AnyObject]
            if let names = json[1]["names"] as? [String] {
                print(names)
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }
        
        
        
        let parameters =  [
            "provider": [
                "systemGroup": "Pl1",
                "systemName": "TemperatureSeno123",
                "IPAddress": "127.0.0.1",
                "port": "8080",
                "authenticationInfo": "ssaw"
            ],
            "serviceURI": "/asdas",
            "serviceMetadata": [["key":"name","value":"alma"],["key":"name2","value":"korte"]],
            "tSIG_key": "RIuxP+vb5GjLXJo686NvKQ=="
        ]
        
        
        do {
            let jsonData = try NSJSONSerialization.dataWithJSONObject(parameters, options: NSJSONWritingOptions.PrettyPrinted)
            // here "jsonData" is the dictionary encoded in JSON data
            print(parameters)
        } catch let error as NSError {
            print(error)
        }
        
        
        
        label.text=tab1Label
        
   
        
//        Alamofire.request(.GET, "https://arrowhead.azurewebsites.net") //parameters: ["foo": "bar"])
//            .responseJSON { response in
//                print(response.request)  // original URL request
//                print(response.response) // URL response
//                print(response.data)     // server data
//                print(response.result)   // result of response serialization
//                UIApplication.sharedApplication().networkActivityIndicatorVisible = true
//                
//                if let JSON = response.result.value {
//                    print("JSON: \(JSON)")
//                   // print("JSON: \(JSON[JSON.count-1]["id"])")
//                }
//                else {}
//        }
        
        Alamofire.request(.GET, "https://arrowhead.azurewebsites.net") //parameters: ["foo": "bar"])
            .responseData { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                UIApplication.sharedApplication().networkActivityIndicatorVisible = true
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    // print("JSON: \(JSON[JSON.count-1]["id"])")
                }
                else {}
        }

        
        
        }

        // Do any additional setup after loading the view.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func changeLabelText() {
        label.text = tab1Label
        print("change")
    }
    
    
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

