//
//  SettingViewController.swift
//  Uni+
//
//  Created by Geng Xu on 2017/9/27.
//  Copyright © 2017年 Chase Liu. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {

    
    
    @IBOutlet weak var temperatureOption: UIPickerView!
    
    @IBOutlet weak var campusOption: UIPickerView!
    
    var campus: String?
    var weatherType : String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //need ingenore
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "SideMenu-1")!)
       self.view.contentMode = .scaleAspectFill
        
        
      
        
        temperatureOption.dataSource = self
        temperatureOption.delegate = self
        
        campusOption.dataSource = self
        campusOption.delegate = self
        
        
        UITableViewCell.appearance().backgroundColor = UIColor.clear
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()

        
    }

    @IBAction func save(_ sender: UIButton) {
        
        
        if let setCam = self.campus, let setWeather = self.weatherType {
        
        MydayModel.shared.setCampus(campus: setCam)
            
          
            if setWeather == "C" {
            
                MydayModel.shared.isCel = true
            
            }
            else {
            
            MydayModel.shared.isCel = false
                
                
            }
            self.notifyUser(["Settings updated, will be applied next time log in"])
        
        }
        
        else {
            
        self.notifyUser(["Please change something :)"])
        
        }
        
        
    }
    
    
    func notifyUser( _ message: [String] ) -> Void
    {
        let meg: String = message[0]
        let alert = UIAlertController(title: "Uni+", message: meg, preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
        
    }
  
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
         if temperatureOption == pickerView{
            return WeatherModelViewItem.shared.tempArray.count
        }else {
            return WeatherModelViewItem.shared.campusArray.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
         if temperatureOption == pickerView{
            return WeatherModelViewItem.shared.tempArray[row]
        }else if campusOption == pickerView{
            return WeatherModelViewItem.shared.campusArray[row]
        }

        return ""
    }
    
    //set the pickerView color
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel = view as? UILabel;
        
        if (pickerLabel == nil)
        {
            pickerLabel = UILabel()
            pickerLabel!.textAlignment = NSTextAlignment.center
            pickerLabel!.textColor = UIColor.white
        }
       
        if temperatureOption==pickerView{
            pickerLabel?.text = WeatherModelViewItem.shared.tempArray[row]
            
        }else{
            pickerLabel?.text = WeatherModelViewItem.shared.campusArray[row]
        }
        return pickerLabel!
        }
    
    @IBAction func `return`(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        if temperatureOption == pickerView{
            self.weatherType = WeatherModelViewItem.shared.tempArray[row]
        }else if campusOption == pickerView{
            self.campus =  WeatherModelViewItem.shared.campusArray[row]
        }
        
    }
        

}
