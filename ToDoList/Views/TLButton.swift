//
//  TLButton.swift
//  ToDoList
//
//  Created by Yvan Gauthier on 12/01/2025.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(color)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(title: "Value",
             color: .blue){
        // Action
    }
}
