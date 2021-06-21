//
//  TasksViewController.swift
//  RealmApp
//
//  Created by admin on 15.06.2021.
//

import UIKit
import RealmSwift

class TasksViewController: UITableViewController {

    var currentTaskList: TaskList!
    
    var currentTask: Results<Task>!
    var completedTask: Results<Task>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = currentTaskList.name
        
        filteringData()
    }
    
    @IBAction func editButtonPressed(_ sender: Any) {
    }
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        alertForAddAndUpdateList()
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? currentTask.count : completedTask.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "CURRENT TASKS" : "COMPLETED TASKS"
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TasksCell", for: indexPath)

        var task: Task!
        
        task = indexPath.section == 0 ? currentTask[indexPath.row] : completedTask[indexPath.row]
        cell.textLabel?.text = task.name
        cell.detailTextLabel?.text = task.specification
        
        return cell
    }
    
    private func filteringData() {
        currentTask = currentTaskList.task.filter("status = false")
        completedTask = currentTaskList.task.filter("status = true")
        
        tableView.reloadData()
    }
    

}

extension TasksViewController {
    
    private func alertForAddAndUpdateList() {
        
        let alert = UIAlertController(title: "New Task", message: "Please insert task value", preferredStyle: .alert)
        var taskTextField: UITextField!
        var noteTextField: UITextField!
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let text = taskTextField.text , !text.isEmpty else { return }
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        alert.addTextField { textField in
            taskTextField = textField
            taskTextField.placeholder = "New task"
        }
        
        alert.addTextField { textField in
            noteTextField = textField
            noteTextField.placeholder = "Note"
        }
        
        present(alert, animated: true)
    }
}

