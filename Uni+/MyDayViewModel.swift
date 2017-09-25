//
//  MyDayViewModel.swift
//  Uni+
//
//  Created by Chase on 23/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import Foundation


class WeatherModelViewItem{

    var myDay = MydayModel()
    let weatherModel = Weather()
    
    
    init() {
        self.updateWeather()
    }
    
    var date: String = ""
    var icon: UIImage = UIImage()
    var temp: String = ""
    var weatherDes: String = ""
    var campus: String = ""
    
    
    

    
    func updateWeather(){
       let u = myDay.getCoordinates()
        self.campus = myDay.campus
        self.date = myDay.getCurrentTime()
        
    ConnectionManager.getJSON(url: u) { (success, json) in
        
        
        if(success){
            
            let weather : [String: Any] = json["currently"].dictionaryObject!
            
           self.weatherDes = weather["summary"] as! String
            self.icon = self.weatherModel.getIcon(weather: self.weatherDes)
            self.temp = weather["apparentTemperature"] as! String
            
            
        }
        else{
            print("error")
            
            
        }
        
        
        }
        
        }
    
    
    
    
    }



