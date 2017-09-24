//
//  MydayModel.swift
//  Uni+
//
//  Created by Chase on 26/8/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import Foundation
import UIKit



struct MydayModel {

    static let campuses = ["City Campus":"-37.8089435,144.8250415","Bundoora Campus": "-37.8089435,144.8250415", "Brunswick Campus": "-37.7903556,144.944014"]
    
    var campus: String = "City Campus"
    var coordinates: String = ""
    var CurrentTime: String?
    var fara: Double?
    var cel: Double?
    
    
    mutating func setCampus(campus: String){
    
    self.campus = campus
    
    
    }
    
    mutating func getCoordinates(){
    
        if self.campus != "" {
        
            for cam in MydayModel.campuses.keys{
                
                
                if cam == self.campus {
                
                self.coordinates = MydayModel.campuses[cam]!
                
                }
            
            
            }
        
        }
    
    
    }
    
    mutating func getCelsius() -> Double{
    
    self.cel = (self.fara! - 32)/1.8
    
        return self.cel!
    }
    
    
 
 

}
