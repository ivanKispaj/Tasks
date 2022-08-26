//
//  Task.swift
//  Task
//
//  Created by Ivan Konishchev on 22.08.2022.
//

import Foundation

protocol Task {
    var task: String {get set}
    func open() -> [Task]
    func addFolder(_ task: [Task])
}
