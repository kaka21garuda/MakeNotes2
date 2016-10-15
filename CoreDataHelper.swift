//
//  CoreDataHelper.swift
//  MakeNotes2
//
//  Created by Buka Cakrawala on 10/12/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataHelper {
    static let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    static func addNote(note: Note) {
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error)")
        }
    }
    
    static func delete(note: Note) {
        CoreDataHelper.managedContext.delete(note)
        saveNote()
    }
    
    
   static func retrieveNotes() -> [Note] {
        let fetchRequest = NSFetchRequest<Note>(entityName: "Note")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
        return []
    }
    
    static func saveNote() {
        do {
            
            try managedContext.save()
        
        } catch let error as NSError {
            
            print("Could not save \(error)")
        
        }
    
    }


    
}

