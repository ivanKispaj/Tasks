//
//  TasksSceneViewController.swift
//  Tasks
//
//  Created by Ivan Konishchev on 22.08.2022.
//

import UIKit

class TasksSceneViewController: UIViewController,TaskDelegate {
 

    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var tableView: UITableView!
    
    var task: [Task] = []
    var folder: Int = 0
    var navBarTitle: String = ""
    weak var taskDelegate: TaskDelegate!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.title = navBarTitle
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: AppData.cellNibIdentifier.rawValue, bundle: nil), forCellReuseIdentifier: AppData.cellNibIdentifier.rawValue)
    }
    
    deinit {
        print("Task deinit")
    }
    
    
    
    
//MARK: - IBAction
    @IBAction func addedTasksButton(_ sender: Any) {
        let allert = UIAlertController(title: AppData.allertTitle.rawValue,message: nil, preferredStyle: .alert)
        allert.addTextField()
        let action = UIAlertAction(title: AppData.allertActionName.rawValue, style: .default) { [weak allert] action in
            guard let task = allert?.textFields?.first?.text else { return }
            self.task.append(SingleTask(task: task))
            DispatchQueue.main.async {
                self.tableView.reloadData()

            }
        }
        allert.addAction(action)
        self.present(allert, animated: true)
    }
    
    @IBAction func backBatton(_ sender: Any) {
 
        taskDelegate.saveTask(from: self.task, to: self.folder)
        self.dismiss(animated: true)
    }
    
}

extension TasksSceneViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppData.cellNibIdentifier.rawValue) as? TasksCell else {
            preconditionFailure("Error: cell taskscene")
        }
        cell.configureCell(with: task[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: AppData.storyboardName.rawValue, bundle: nil)
        guard let nextVC = storyboard.instantiateViewController(withIdentifier: AppData.taskSceneIdentifier.rawValue) as? TasksSceneViewController else {
            return
        }
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.task = self.task[indexPath.row].open()
        nextVC.navBarTitle = self.task[indexPath.row].task
     
        nextVC.taskDelegate = self
        nextVC.folder = indexPath.row
        self.present(nextVC, animated: true)
        
        
    }
    
    func saveTask(from task: [Task], to row: Int) {
        self.task[row].addFolder(task)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
