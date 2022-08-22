//
//  TasksCell.swift
//  Tasks
//
//  Created by Ivan Konishchev on 22.08.2022.
//

import UIKit

class TasksCell: UITableViewCell {

    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var subtaskCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(with task: Task) {
        self.taskName.text = task.nameTask
        if task.oepn().count > 0 {
            self.subtaskCount.text = String(task.oepn().count)
        }
    }
    
}
