//
//  TaskList.swift
//  RealmApp
//
//  Created by admin on 21.06.2021.
//

import Foundation
import RealmSwift

class TaskList: Object {
    @objc dynamic var name = ""
    
    let task = List<Task>()
}
