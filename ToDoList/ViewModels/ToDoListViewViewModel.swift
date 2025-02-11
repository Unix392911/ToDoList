//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Yvan Gauthier on 12/01/2025.
//

import FirebaseFirestore
import Foundation

/// ViewModel for the list of items  view
/// Primary lab
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    /// Delete to do list item
    /// - Parameter id : item id to delete
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("user")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
