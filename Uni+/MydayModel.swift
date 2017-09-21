//
//  MydayModel.swift
//  Uni+
//
//  Created by Chase on 26/8/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import Foundation
import UIKit


//class Weather
//{
//    var image: UIImage
//    var temper: String
//    var location: String
//    var date: String
//    
//    init(temper: String, location: String, date: String, imageName: String){
//        self.temper = "17 C"
//        self.location = "City Campus"
//        self.date = "2017 Sep 13"
//        self.image = UIImage(named:"Sun")!
//        
//        
//    }
//
//}

class MydayModel {


    
    let pics = [#imageLiteral(resourceName: "Weather"), #imageLiteral(resourceName: "Lecture"),#imageLiteral(resourceName: "Event"),#imageLiteral(resourceName: "Assignment")]
    
    init() {
        
        
        
        
    }
    
    func getModel()->[UIImage]{
    
    return pics
    }
    
    func Get(index: Int) -> UIImage{
        
        let im: UIImage  = pics[index]
        
    return im
    
    }
    



}
