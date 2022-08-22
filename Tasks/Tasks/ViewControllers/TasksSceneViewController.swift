//
//  TasksSceneViewController.swift
//  Tasks
//
//  Created by Ivan Konishchev on 22.08.2022.
//

import UIKit

class TasksSceneViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var tableView: UITableView!
    var task: [Task]!
    var navBarTitle: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.title = navBarTitle
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TasksCell", bundle: nil), forCellReuseIdentifier: "TasksCell")
    }
    
//MARK: - IBAction
    @IBAction func addedTasksButton(_ sender: Any) {
    }
    
    @IBAction func backBatton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}

extension TasksSceneViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TasksCell") as? TasksCell else {
            preconditionFailure("Error: cell taskscene")
        }
        cell.configureCell(with: task[indexPath.row])
        return cell
    }
    
    
}
