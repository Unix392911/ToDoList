//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Yvan Gauthier on 15/01/2025.
//

import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String){
        self._items = FirestoreQuery(
            collectionPath: "user/\(userId)/todos"
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }
    var body: some View {
        NavigationView{
            VStack {
                List(items) { item in
                    ToDoLisItem(item: item)
                        .swipeActions {
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button{
                    // Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }  
}

#Preview {
    ToDoListView(userId: "VtRp2mkPNCPUjZttdNJmgtzxFYf2")
}
