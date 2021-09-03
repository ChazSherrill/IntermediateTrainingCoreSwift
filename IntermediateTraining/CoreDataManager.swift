//
//  CoreDataManager.swift
//  IntermediateTraining
//
//  Created by Chaz Sherrill on 9/3/21.
//  Copyright © 2021 Lets Build That App. All rights reserved.
//

import CoreData

struct CoreDataManager
{
    static let shared = CoreDataManager() // will live forecver as long as your application is still alive, it's properties will do
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "IntermediateTrainingModels")
        container.loadPersistentStores { (storeDescription, err) in
            if let err = err{
                fatalError("Loading of store failed: \(err)")
            }
        }
        return container
    }()
}
