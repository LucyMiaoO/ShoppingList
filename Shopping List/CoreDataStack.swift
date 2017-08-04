//
//  CoreDataStack.swift
//  Shopping List
//
//  Created by XinyuMiao on 2017/4/3.
//  Copyright © 2017年 Xinyu Miao. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    lazy var managedObjectModel: NSManagedObjectModel = {
        let modelUrl = Bundle.main.url(forResource: "Shopping_List", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelUrl)!
    }()
    
    
    lazy var peristentStoreCoordinator: NSPersistentStoreCoordinator = {
        let coordinator: NSPersistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let applicationDocumentsDirectory: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
        let persistentStoreUrl: URL = applicationDocumentsDirectory.appendingPathComponent("Shopping_List.sqlite")
        
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: persistentStoreUrl, options: nil)
        }
        catch {
            fatalError("Persistent store error! \(error)")
        }
        
        return coordinator
    }()
    
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        let managedObjectContext: NSManagedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = self.peristentStoreCoordinator
        
        return managedObjectContext
    }()
    
    
    func saveContext() {
        if self.managedObjectContext.hasChanges {
            do {
                try self.managedObjectContext.save()
            }
            catch {
                fatalError("There was an error saving the managed object context \(error)")
            }
        }
    }

}
