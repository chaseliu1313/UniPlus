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
    
    var isCel = true
    
    init() {
        self.updateWeather()
    }
    
    var date: String = ""
    var icon: UIImage = UIImage()
    var temp: String = ""
    var weatherDes: String = ""
    var campus: String = ""
    
    
    

    //load static value from model and retrieve instant value from weather api
    
    func updateWeather(){
       let u = myDay.getCoordinates()
        self.campus = myDay.campus
        self.date = myDay.getCurrentTime()
        
    ConnectionManager.getJSON(url: u) { (success, json) in
        
        
        if(success){
            
            let weather : [String: Any] = json["currently"].dictionaryObject!
            
           self.weatherDes = weather["summary"] as! String
            self.icon = self.weatherModel.getIcon(weather: self.weatherDes)
            let temper = weather["apparentTemperature"] as! Double
            
            self.isCel = self.myDay.isCel
            
            if self.isCel {
            
            self.temp = String(Int(self.myDay.getCelsius(fara: temper))) + "  °C"
            }
            else {
            
                self.temp = String(temper) + "  °F"
            
            }
            
            
        }
        else{
            print("error")
            
            
        }
        
        
        }
        
        }
    
    //update Faraheight or Celsius value to model
    func updateModel(isCel: Bool){
        
        self.isCel = isCel
        self.myDay.isCel = isCel
    
    }
    
    
    }



