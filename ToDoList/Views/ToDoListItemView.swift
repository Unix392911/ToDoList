//
//  ToDoLisNewItem.swift
//  ToDoList
//
//  Created by Yvan Gauthier on 12/01/2025.
//

import SwiftUI

struct ToDoLisItem: View {
    @State var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem
   
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                   
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ?
                      "checkmark.circle.fill" : "circle" )
                .foregroundColor(Color.blue)
            }
        }
    }
}

#Preview {
    ToDoLisItem(item: .init(id: "123",
                               title: "Get Milk",
                               dueDate: Date().timeIntervalSince1970,
                               createdDate:  Date().timeIntervalSince1970,
                               isDone: true))
}
