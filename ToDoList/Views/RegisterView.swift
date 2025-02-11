//
//  RegisterView.swift
//  ToDoList
//
//  Created by Yvan Gauthier on 12/01/2025.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack{
            HeaderView(title: "Register",
                       subtitle: "Start Organizing ToDos",
                       angle: -15,
                       background: .orange)
            // Form
            Form{
                TextField("Full name ...", text:$viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                TextField("Email ...", text:$viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password ...", text:$viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TLButton(title: "Register",
                         color: .green
                ){
                    // Action
                    viewModel.register()
                }
                .padding()
            }
        }
    }
}

#Preview {
    RegisterView()
}
