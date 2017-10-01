//
//  DetialViewController.swift
//  Uni+
//
//  Created by Chase on 27/8/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit

class DetialViewController: UIViewController, UITextViewDelegate {
    
    var text: String = ""
    var masterView:NoteControllerViewController!
    
    
    
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = text
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        textView.becomeFirstResponder()
        
    }

    // send the edited information back to the note screen
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        masterView.newRowText = textView.text
    }
    
   
    func setText(input: String){
        text = input
        
        if isViewLoaded{
            textView.text = input}
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.resignFirstResponder()
        
    }
   

}
