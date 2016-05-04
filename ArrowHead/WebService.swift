//
//  WebService.swift
//  ArrowHead
//
//  Created by Denes Csizmadia on 30/04/16.
//  Copyright © 2016 Denes Csizmadia. All rights reserved.
//

import Foundation
import Alamofire


func PostToServer (uri:String, parameters : ([String : NSObject])) -> NSData? {
    var json : NSData?
    Alamofire.request(.POST, uri, parameters: parameters, encoding: .JSON)
        .responseData { response in
            print(response.request)  // original URL request
            print(response.response) // URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
           // UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                // print("JSON: \(JSON[JSON.count-1]["id"])")
               json = JSON
            }
    }
    return json
}


