//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Yvan Gauthier on 12/01/2025.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

/// ViewModel for single to do list item
/// Primary lab 
class ToDoListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("user")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .updateData(itemCopy.asDictionary())
    }
}
