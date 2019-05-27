//
//  Store.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 5/7/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import UIKit
import CoreData

enum PersistenceError: Error {
    
    case objectNotFound
    case couldNotSaveObject
    case managedObjectContextNotFound
}
struct Store {
    
    static var persistentStoreCoordinator: NSPersistentStoreCoordinator? {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            return appDelegate.persistentContainer.persistentStoreCoordinator
        }
        return nil
    }
    static var managedObjectModel: NSManagedObjectModel? {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            return appDelegate.persistentContainer.managedObjectModel
        }
        return nil
    }
    static var managedObjectContext: NSManagedObjectContext? {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            return appDelegate.persistentContainer.viewContext
        }
        return nil
    }
}
