//
//  Task.swift
//  RealmApp
//
//  Created by admin on 21.06.2021.
//

import Foundation
import RealmSwift

class Task: Object {
    @objc dynamic var name = ""
    @objc dynamic var specification = ""
    @objc dynamic var status = false
}
