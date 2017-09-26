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
    //campus name module
    static let campuses = ["City Campus":"-37.8089435,144.8250415","Bundoora Campus": "-37.8089435,144.8250415", "Brunswick Campus": "-37.7903556,144.944014"]
    
    var campus: String = "City Campus"
    var coordinates: String = "-37.8089435,144.8250415"
    var CurrentTime: String?
    
    var isCel = true
    var temper: Double?
    
    
    init(){
    
    
    }
    
    
    mutating func setCampus(campus: String){
    
    self.campus = campus
    
    
    }
    
    //return the chosen coordinates of the campus
    mutating func getCoordinates()->String{
    
        if self.campus != "" {
        
            for cam in MydayModel.campuses.keys{
                
                
                if cam == self.campus {
                
                self.coordinates = MydayModel.campuses[cam]!
                
                }
            
            
            }
        
        }
    return self.coordinates
    
    }
    
    //turn Faraheight temperature into Celsius
    mutating func getCelsius(fara: Double) -> Double{
    
    self.temper = (fara - 32)/1.8
    
        return self.temper!
    }
    
    mutating func getCurrentTime()->String{
    
        let df = DateFormatter()
        
        let currentDate = Date()
        
        
        df.dateFormat = "yyyy"
        let year = df.string(from: currentDate)
        df.dateFormat = "MMMM"
        let month = df.string(from: currentDate)
        df.dateFormat = "dd"
        let day = df.string(from: currentDate)
        
        self.CurrentTime = "\(year)-\(month)-\(day)"
    
         return CurrentTime!
    }
 
 

}

struct Weather {
    
     let formatter = DateFormatter()
     let date = Date()
    
    
    
    //static weather icon module for day time
     let dayWeather : [String: UIImage] = ["Cloudy": #imageLiteral(resourceName: "Cloudy"), "Drizzle" : #imageLiteral(resourceName: "Drizzle"), "Foggy":#imageLiteral(resourceName: "Foggy"), "Light Rain" : #imageLiteral(resourceName: "Light-Rain"), "Overcast": #imageLiteral(resourceName: "Overcast"), "Partly Cloudy": #imageLiteral(resourceName: "Partly CloudyDay"), "Mostly Cloudy": #imageLiteral(resourceName: "Cloudy"), "Rain": #imageLiteral(resourceName: "Rain"), "Snow": #imageLiteral(resourceName: "Snow"), "Thunder":#imageLiteral(resourceName: "Thunder"), "Heavy Rain": #imageLiteral(resourceName: "Rain")]
    //static weather icon module for night time
     let nightWeather : [String: UIImage] = ["Clear": #imageLiteral(resourceName: "Night-Clear"), "Partly Cloudy": #imageLiteral(resourceName: "Night-PartlyCloudy"), "Mostly Cloudy" : #imageLiteral(resourceName: "Overcast"), "Cloudy": #imageLiteral(resourceName: "Night-PartlyCloudy"), "Overcast": #imageLiteral(resourceName: "Overcast"), "Rain": #imageLiteral(resourceName: "ModRain-Night"), "Snow": #imageLiteral(resourceName: "Snow"),"Thunder": #imageLiteral(resourceName: "Thunder"), "Foggy":#imageLiteral(resourceName: "Foggy"),"Light Rain" : #imageLiteral(resourceName: "Light-Rain"),"Heavy Rain": #imageLiteral(resourceName: "ModRain-Night"),"Drizzle" : #imageLiteral(resourceName: "Drizzle")]

   // func return the requested icon by the description
     func getIcon(weather: String)->UIImage
    {
        formatter.dateFormat = "HH"
        let hour = Int(formatter.string(from: date))
        var icon : UIImage?
        
        if hour! <= 19 && hour! >= 5 {
        
            for key in dayWeather.keys
            
            {
                 if key == weather || weather.contains(key){
                
                icon = dayWeather[key]
                    
                }
                else
                {
                icon = #imageLiteral(resourceName: "Partly CloudyDay")
                    
                }
            
            }
            
        
        }
        
        else{
            
            for key in nightWeather.keys
                
            {
                if key == weather || weather.contains(key){
                    
                    icon = nightWeather[key]
                    
                }
                else
                {
                    icon = #imageLiteral(resourceName: "Night-Clear")
                    
                }
                
            }
        
        
        }
        
    
      return icon!
    }
    
}
