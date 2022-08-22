//
//  Task.swift
//  Task
//
//  Created by Ivan Konishchev on 22.08.2022.
//

import Foundation

protocol Task {
    var nameTask: String { get }
    func oepn() -> [Task]
}
