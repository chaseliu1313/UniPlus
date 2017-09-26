//
//  NewCell.swift
//  Uni+
//
//  Created by Chase on 26/8/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

 
    @IBOutlet weak var campus: UILabel!
    @IBOutlet weak var datentime: UILabel!
    @IBOutlet weak var Temp: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherDescip: UILabel!
    
    
    
    
    func setData(weather: WeatherModelViewItem?){
    
        guard let weatherData = weather
            
            else {return}
        
       self.campus.text = weatherData.campus
      self.datentime.text = weatherData.date
        self.Temp.text = weatherData.temp
        self.weatherIcon.image = weatherData.icon
        self.weatherDescip.text = weatherData.weatherDes
    
    }
    
    
    
    
    

}
