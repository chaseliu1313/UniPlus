//
//  ConnectionManager.swift
//  Uni+
//
//  Created by Chase on 23/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ConnectionManager {


   static let baseUrl = "https://api.darksky.net/forecast/0de20a0ec3ffe340a99836631b96d01a/"


    
    
    static func getJSON(url: String, completion: @escaping (Bool,JSON) -> Void){
        
        let url = baseUrl + url
        
        Alamofire.request(url).responseJSON { (response) in
            
            
            let json = JSON(response.data!)
            
            switch response.result{
                
            case .success(_):
                
                
                
                
                completion(true, json)
                
                
                
            case .failure(_):
                print("connection faild")
                completion(false, JSON.null)
                
            }
            
        }
        
        
    }



}

