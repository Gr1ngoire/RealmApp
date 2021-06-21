//
//  StorageManager.swift
//  RealmApp
//
//  Created by admin on 21.06.2021.
//

import Foundation
import RealmSwift

let realm = try! Realm()

class StorageManager {
    static func saveTaskList (taskList: [TaskList]) {
        try! realm.write {
            realm.add(taskList)
        }
    }
}
