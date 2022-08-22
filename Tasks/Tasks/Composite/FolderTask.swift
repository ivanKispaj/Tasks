//
//  FolderTask.swift
//  Tasks
//
//  Created by Ivan Konishchev on 22.08.2022.
//

import Foundation


final class FolderTask: Task {
   
    let nameTask: String
    let subTask: [Task]
    init(task: String, subTask: [Task] = []) {
        self.nameTask = task
        self.subTask = subTask
        
    }

    
    func oepn() -> [Task] {
  
        return subTask
    }
    
    
}
