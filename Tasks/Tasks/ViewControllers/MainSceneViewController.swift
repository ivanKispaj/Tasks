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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        navigationBar.title = "All tasks"
        tableView.register(UINib(nibName: "TasksCell", bundle: nil), forCellReuseIdentifier: "TasksCell")
    }

//MARK: - IBAction
    
    @IBAction func addedTask(_ sender: Any) {
        
    }
}

extension MainSceneViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TasksCell") as? TasksCell else {
            preconditionFailure("Error: cell mainscene")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "TasksSceneViewController")
        self.present(nextVC, animated: true)
        
    }
    
    
}
