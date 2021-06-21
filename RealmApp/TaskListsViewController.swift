//
//  TaskListsViewController.swift
//  RealmApp
//
//  Created by admin on 15.06.2021.
//

import UIKit
import RealmSwift

class TaskListsViewController: UITableViewController {

    var taskLists: Results<TaskList>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskLists = realm.objects(TaskList.self)
        
//        let bookList = TaskList()
//        bookList.name = "Book List"
//
//        let bookMastAndMarg = Task()
//        bookMastAndMarg.name = "Master and Margaret"
//        bookMastAndMarg.specification = "1Item"
//        bookMastAndMarg.status = false
//
//        let faust = Task(value: ["Faust", "1Item", false])
//        let zigzag = Task(value: ["name":"Zigzag", "specification":"1Item", "status":false])
//
//
//        bookList.task.append(bookMastAndMarg)
//        bookList.task.insert(contentsOf: [faust, zigzag], at: 1)
//
//        // ============
//        let moviesList = TaskList()
//        moviesList.name = "Movie List"
//
//        let johnWick = Task(value: ["name":"John Wick", "specification":"1Watch", "status":false])
//        let godfather = Task(value: ["name":"Godfather", "specification":"1Watch", "status":false])
//        let starWars = Task(value: ["name":"Star Wars:Empire strikes back", "specification":"1Watch", "status":false])
//
//        moviesList.task.insert(contentsOf: [johnWick, godfather, starWars], at: 0)
//
//        DispatchQueue.main.async {
//            StorageManager.saveTaskList(taskList: [bookList, moviesList])
//        }
        

    }
    
    @IBAction func editButtonPressed(_ sender: Any) {
    }
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        alerForAddAndUpdateList()
    }
    
    
    @IBAction func sortingList(_ sender: UISegmentedControl) {
    }
    
  
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskLists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskListCell", for: indexPath)

        let taskList = taskLists[indexPath.row]
        cell.textLabel?.text = taskList.name
        cell.detailTextLabel?.text = "\(taskList.task.count)"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let taskList = taskLists[indexPath.row]
            let tasksVC = segue.destination as! TasksViewController
            tasksVC.currentTaskList = taskList
        }
    }

}


extension TaskListsViewController {
    
    private func alerForAddAndUpdateList() {
        
        let alert = UIAlertController(title: "New List", message: "Please insert new value", preferredStyle: .alert)
        var alertTextField: UITextField!
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let text = alertTextField.text , !text.isEmpty else { return }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        alert.addTextField { textField in
            alertTextField = textField
            alertTextField.placeholder = "List Name"
        }
        
        present(alert, animated: true)
    }
}

