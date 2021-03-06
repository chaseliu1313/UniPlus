//
//  NoteControllerViewController.swift
//  Uni+
//
//  Created by Chase on 26/8/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit

class NoteControllerViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var NoteTable: UITableView!
    //var note: NoteModel = NoteModel()
    var noteVM = NoteViewModel()
    
    
    var selectedRow: Int = 0
    var newRowText: String = ""
    var data:[String] = ["row1" ,"row2"]
    var seletedNoteID : Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UI adjustment
        NoteTable.backgroundView = UIImageView(image: UIImage(named: "purpleBackGround"))
        NoteTable.backgroundView?.contentMode = .scaleAspectFill
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let addB = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addNotes))
        
        self.navigationItem.rightBarButtonItem = addB
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        // end of UI adjustment
        
        
        load()
        
        sideMenu()
        
    }
    
    //handle change from the editing screen
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if selectedRow == -1 {
            
        return
            
        }
        
        let note = noteVM.loadedNote[selectedRow]
        note.description = newRowText
        if noteVM.edit(note: note){
            NoteTable.reloadData()
        }
        else{
        print("editing did not save")
        }
        
        
    }
    
    
    //insert new row at the top and go into the detail page
    func addNotes(){
        

        
        let name: String = "New Note"
        
        let note: Note = noteVM.formNote(content: name)
        note.description = name
        
        if noteVM.addNote(note: note) {
        

            self.performSegue(withIdentifier: "Detail", sender: nil)
            NoteTable.reloadData()
        }
        
        else {
        
        print("error")
            
        }
        
  
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
   
    //send note object information through segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let detailView: DetialViewController = segue.destination as! DetialViewController
        
        if noteVM.loadedNote.count == 0 {
        
            detailView.setText(input: "New Note")
        
        }
        else {
        
            print("error row\(selectedRow)")
        detailView.masterView = self
        detailView.setText(input: noteVM.loadedNote[selectedRow].description)
        }
    }
    
   
    
    func load(){
        noteVM.loadNotes()
        NoteTable.reloadData()
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

extension NoteControllerViewController:  UITableViewDataSource, UITableViewDelegate {


    //return the number of sections
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return noteVM.loadedNote.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "NoteCell")!
        
        cell.textLabel?.text = self.noteVM.getTitle(content: noteVM.loadedNote[indexPath.row].description)
        
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.clear
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.newRowText = noteVM.loadedNote[indexPath.row].description
        
        self.selectedRow = indexPath.row
        
        self.performSegue(withIdentifier: "Detail", sender: nil)
        
        
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if editingStyle == UITableViewCellEditingStyle.delete{
            
            let note = noteVM.loadedNote[indexPath.row]
            
            if noteVM.delete(note: note) {
            
              
               
                self.load()
                
                
            
            }
            else{
            print("delete failed")
            }
            
           
            
        }
    
    }
        
}
