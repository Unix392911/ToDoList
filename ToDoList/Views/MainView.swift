//
//  ContentView.swift
//  ToDoList
//
//  Created by Yvan Gauthier on 12/01/2025.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        
        if viewModel.isSignIn, !viewModel.curentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View {
        TabView {
            // Signed in
            ToDoListView(userId: viewModel.curentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
