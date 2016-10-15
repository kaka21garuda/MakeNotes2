//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit


class DisplayNoteViewController: UIViewController {
    
    var note: Note?
    
    @IBOutlet weak var noteContentTextView: UITextView!
    @IBOutlet weak var noteTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let note = note {
            noteTextField.text = note.title
            noteContentTextView.text = note.content
        } else {
            noteTextField.text = ""
            noteContentTextView.text = ""
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let listNotesTableViewController = segue.destination as! ListNotesTableViewController
        if segue.identifier == "Save" {
            if let note = note {
            note.title = noteTextField.text ?? ""
            note.content = noteContentTextView.text ?? ""
            note.modificationTime = Date()
            CoreDataHelper.saveNote()
            
           // listNotesTableViewController.tableView.reloadData()
        } else {
            //if does not exist
            let note = Note()
            note.title = noteTextField.text ?? ""
            note.content = noteContentTextView.text ?? ""
            note.modificationTime = Date()
            CoreDataHelper.addNote(note: note)
            
        
            
            }
        
        
        }
    }
    


}
