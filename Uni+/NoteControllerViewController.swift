//
//  NoteControllerViewController.swift
//  Uni+
//
//  Created by Chase on 26/8/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit

class NoteControllerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var menuButton: UIBarButtonItem!
  
    
    @IBOutlet weak var NoteTable: UITableView!
    //var note: NoteModel = NoteModel()
    
    var selectedRow: Int = -1
    var newRowText: String = ""
    var data:[String] = ["row1" ,"row2"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NoteTable.backgroundView = UIImageView(image: UIImage(named: "purpleBackGround"))
        NoteTable.backgroundView?.contentMode = .scaleAspectFill
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let addB = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addNotes))
        
        self.navigationItem.rightBarButtonItem = addB
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        load()
        
        sideMenu()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        if selectedRow == -1 {
        return
        }
        data[selectedRow] = newRowText
        
        newRowText = data[selectedRow]
        
        if newRowText == "" {
            data.remove(at:selectedRow)
            
        }
        NoteTable.reloadData()
        save()
    }
    
    func addNotes(){
        
        
        if (NoteTable.isEditing) {
            NoteTable.isEditing = false
            return
        }
        let name: String = "New Note"
        data.insert(name, at: 0)
        
        let indexPath:IndexPath = IndexPath(row: 0, section:0)
        NoteTable.insertRows(at: [indexPath], with: .automatic)
        NoteTable.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        self.performSegue(withIdentifier: "Detail", sender: nil)
        
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if editingStyle == UITableViewCellEditingStyle.delete{
        
        data.remove(at: indexPath.row)
        NoteTable.reloadData()
        NoteTable.deleteRows(at: [indexPath], with: .fade)
        }
        
        
        
        
        
        save()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //return the number of sections
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "NoteCell")!
        
        cell.textLabel?.text = data[indexPath.row]
        cell.backgroundColor = UIColor.clear

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         self.performSegue(withIdentifier: "Detail", sender: nil)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailView: DetialViewController = segue.destination as! DetialViewController
        selectedRow = NoteTable.indexPathForSelectedRow!.row
        detailView.masterView = self
        detailView.setText(input: data[selectedRow]) //data[selectedRow]
    }
    
    // data saving and loading method for assignment 1
    func save(){
       //UserDefaults.standard.set(note.notes, forKey: "userNotes")
        UserDefaults.standard.synchronize()
    }
    
    func load(){
        if let loadedData = UserDefaults.standard.value(forKey: "userNotes")as? [String]{
          data = loadedData
            NoteTable.reloadData()
        
        }
    }
    
    //open side menu
    func sideMenu()
    {
        
        if revealViewController() != nil{
            
            menuButton.target = self.revealViewController()
            
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
        }
        
    }

}
