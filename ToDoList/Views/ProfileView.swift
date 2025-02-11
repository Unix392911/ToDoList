//
//  ProfileView.swift
//  ToDoList
//
//  Created by Yvan Gauthier on 17/01/2025.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                if let user = viewModel.user{
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.blue)
                        .frame(width: 125, height: 125)
                        .padding()
                    
                    // Info: Name, Email, Member since
                    VStack(alignment: .leading) {
                        HStack{
                            Text("Name: ")
                                .bold()
                            Text(user.name)
                                .padding()
                        }
                        HStack{
                            Text("Email: ")
                                .bold()
                            Text(user.email)
                                .padding()
                        }
                        HStack{
                            Text("Member Since: ")
                                .bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }
                        .padding()
                    }
                    .padding()
                    // Sign out
                    Button("Log Out"){
                        // viewModel.logOut()
                    }
                    .tint(.red)
                    .padding()
                    Spacer()
                    
                } else {
                    Text("Loading profile ...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}

