//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Yvan Gauthier on 12/01/2025.
//

import SwiftUI
import Firebase

@main
struct ToDoListApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
    