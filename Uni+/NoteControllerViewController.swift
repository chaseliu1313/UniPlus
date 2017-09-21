//
//  NoteControllerViewController.swift
//  Uni+
//
//  Created by Chase on 26/8/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit

class NoteControllerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var NoteTable: UITableView!
    var note: NoteModel = NoteModel()
    
    var selectedRow: Int = -1
    var newRowText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NoteTable.backgroundView = UIImageView(image: UIImage(named: "Rectangle 3"))
        NoteTable.backgroundView?.contentMode = .scaleAspectFill
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        let addB = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addNotes))
        
        self.navigationItem.rightBarButtonItem = addB
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = editButtonItem
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        load()
        
        sideMenu()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        if selectedRow == -1 {
        return
        }
        //data[selectedRow] = newRowText
        
        newRowText = note.notes[selectedRow]
        
        if newRowText == "" {
            //data.remove(at:selectedRow)
            note.notes.remove(at: selectedRow)
            
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
        //data.insert(name, at: 0)
        note.notes.insert(name, at: 0)
        let indexPath:IndexPath = IndexPath(row: 0, section:0)
        NoteTable.insertRows(at: [indexPath], with: .automatic)
        NoteTable.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        self.performSegue(withIdentifier: "Detail", sender: nil)
        
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        
        
        
        super.setEditing(editing, animated: animated)
        NoteTable.setEditing(editing, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        //data.remove(at: indexPath.row)
        note.notes.remove(at: indexPath.row)
        NoteTable.deleteRows(at: [indexPath], with: .fade)
        save()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //return the number of sections
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return note.notes.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "NoteCell")!
        
        cell.textLabel?.text = note.notes[indexPath.row]            //data[indexPath.row]
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
        detailView.setText(input: note.notes[selectedRow]) //data[selectedRow]
    }
    
    // data saving and loading method for assignment 1
    func save(){
       UserDefaults.standard.set(note.notes, forKey: "userNotes")
        UserDefaults.standard.synchronize()
    }
    
    func load(){
        if let loadedData = UserDefaults.standard.value(forKey: "userNotes")as? [String]{
          note.notes = loadedData
            NoteTable.reloadData()
        
        }
    }
    
    //open side menu
    func sideMenu()
    {
        
        if revealViewController() != nil{
            
            
            revealViewController().rearViewRevealWidth = 275
            //revealViewController().rightViewRevealWidth = 160
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
        }
        
    }

}
