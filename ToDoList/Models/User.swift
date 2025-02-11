//
//  User.swift
//  ToDoList
//
//  Created by Yvan Gauthier on 15/01/2025.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email:  String
    let joined: TimeInterval 
}
