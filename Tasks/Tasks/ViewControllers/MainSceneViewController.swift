//
//  MainSceneViewController.swift
//  Tasks
//
//  Created by Ivan Konishchev on 22.08.2022.
//

import UIKit

class MainSceneViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var tableView: UITableView!
    
    private var task: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        navigationBar.title = "All tasks"
        tableView.register(UINib(nibName: "TasksCell", bundle: nil), forCellReuseIdentifier: "TasksCell")
    }

//MARK: - IBAction
    
    @IBAction func addedTask(_ sender: Any) {
        let allert = UIAlertController(title: "Новая задача",message: nil, preferredStyle: .alert)
        allert.addTextField()
        let action = UIAlertAction(title: "Сохранитть", style: .default) { [weak allert] action in
            guard let task = allert?.textFields?.first?.text else { return }
            self.task.append(FolderTask(task: task))
            DispatchQueue.main.async {
                self.tableView.reloadData()

            }
        }
        allert.addAction(action)
        self.present(allert, animated: true)
    }
}

extension MainSceneViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return task.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TasksCell") as? TasksCell else {
            preconditionFailure("Error: cell mainscene")
        }
        cell.configureCell(with: task[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let nextVC = storyboard.instantiateViewController(withIdentifier: "TasksSceneViewController") as? TasksSceneViewController else {
            return
        }
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.task = task[indexPath.row].oepn()
        nextVC.navBarTitle = task[indexPath.row].nameTask
        self.present(nextVC, animated: true)
        
    }
    
    
}
