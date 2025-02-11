//
//  LoginView.swift
//  ToDoList
//
//  Created by Yvan Gauthier on 12/01/2025.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                HeaderView(title: "To Do List",
                           subtitle: "Get things done",
                           angle: 15,
                           background: .pink)
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    TextField("Email ...", text:$viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    SecureField("Password ...", text:$viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    // Button Login
                    TLButton(title: "Login",
                             color: .blue){
                        // Action
                        viewModel.login()
                    }
                             .padding()
                }
                VStack{
                    Text("New arround here ?")
                    NavigationLink("Create a account"
                                   ,destination: RegisterView())
                }
                .padding(.bottom, 50)
                Spacer()
            }
        }
    }
}


#Preview {
    LoginView()
}
