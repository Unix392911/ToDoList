//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Yvan Gauthier on 12/01/2025.
//

import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject {
    @Published var curentUserId : String = ""
    private var handler : AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self] _, user in
            DispatchQueue.main.async {
                self?.curentUserId = user?.uid ?? ""
            }
        }
    }
    public var isSignIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
