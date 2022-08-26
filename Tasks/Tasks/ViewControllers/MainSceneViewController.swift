//
//  MainSceneViewController.swift
//  Tasks
//
//  Created by Ivan Konishchev on 22.08.2022.
//

import UIKit

protocol TaskDelegate: AnyObject {
    func saveTask(from task: [Task], to row: Int)
}

class MainSceneViewController: UIViewController , TaskDelegate{
    
    
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var tableView: UITableView!
    
    private var task: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 //MARK: - parse 3 json object --------------------
        let parseResult = ParseJsonResult()
        let parseData = ParseJsonData()
        let parseJson = ParseJson()
        parseResult.nextParsers = parseData
        parseData.nextParsers = parseJson
        for number in 1...3 {
            let data = OpenJson().data(from: String(number))
            parseResult.parseJson(data)

        }
        
//MARK: -----------------------------
        
        tableView.delegate = self
        tableView.dataSource = self
        navigationBar.title = AppData.mainScreenName.rawValue
        tableView.register(UINib(nibName: AppData.cellNibIdentifier.rawValue, bundle: nil), forCellReuseIdentifier: AppData.cellNibIdentifier.rawValue)
    }
    
    //MARK: - IBAction
    
    @IBAction func addedTask(_ sender: Any) {
        let allert = UIAlertController(title: AppData.allertTitle.rawValue, message: nil, preferredStyle: .alert)
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
}

extension MainSceneViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return task.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppData.cellNibIdentifier.rawValue) as? TasksCell else {
            preconditionFailure("Error: cell mainscene")
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
        nextVC.task = task[indexPath.row].open()
        nextVC.navBarTitle = task[indexPath.row].task
        
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
