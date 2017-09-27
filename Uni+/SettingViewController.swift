//
//  SettingViewController.swift
//  Uni+
//
//  Created by Geng Xu on 2017/9/27.
//  Copyright © 2017年 Chase Liu. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var weekOption: UIPickerView!
    
    @IBOutlet weak var temperatureOption: UIPickerView!
    
    @IBOutlet weak var campusOption: UIPickerView!
    
    
    var dateArray = ["Sat", "Sun", "Mon"]
    var tempArray = ["F","C"]
    var campusArray = ["City", "Bundoora", "Brunswick"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //need ingenore
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "SideMenu-1")!)
       self.view.contentMode = .scaleAspectFill
        
        
        weekOption.dataSource = self
        weekOption.delegate = self
        
        temperatureOption.dataSource = self
        temperatureOption.delegate = self
        
        campusOption.dataSource = self
        campusOption.delegate = self
        
        
        UITableViewCell.appearance().backgroundColor = UIColor.clear
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if weekOption == pickerView {
            return dateArray.count
        } else if temperatureOption == pickerView{
            return tempArray.count
        }else {
            return campusArray.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if weekOption == pickerView {
            return dateArray[row]
        } else if temperatureOption == pickerView{
            return tempArray[row]
        }else if campusOption == pickerView{
            return campusArray[row]
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
        if weekOption==pickerView{
            pickerLabel?.text = dateArray[row]
        }else if temperatureOption==pickerView{
            pickerLabel?.text = tempArray[row]
            
        }else{
            pickerLabel?.text = campusArray[row]
        }
        return pickerLabel!
        }
    
    @IBAction func `return`(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
