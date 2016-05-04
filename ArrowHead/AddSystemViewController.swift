//
//  AddSystemViewController.swift
//  ArrowHead
//
//  Created by Denes Csizmadia on 30/04/16.
//  Copyright © 2016 Denes Csizmadia. All rights reserved.
//

import UIKit
import Alamofire


class AddSystemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("servicestarted")
        
        var uri = "152.66.245.168:8080/serviceregistry/servicegroupname/servicename"
        
        var body = [
                "provider": [
                    "systemGroup": "Pl1",
                    "systemName": "TemperatureSeno123",
                    "IPAddress": "127.0.0.1",
                    "port": "8080",
                    "authenticationInfo": "ssaw"
                            ],
                "serviceURI": "/asdas",
                "serviceMetadata": " ",
                "tSIG_key": "RIuxP+vb5GjLXJo686NvKQ=="
                            ]
        
        Alamofire.request(.POST, uri, parameters: body, encoding: .JSON)
            .responseData { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                // UIApplication.sharedApplication().networkActivityIndicatorVisible = true
                print(body)
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }

        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
