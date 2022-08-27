//
//  ContentView.swift
//  NetworkInterchangeable
//
//  Created by Yigit Ozdamar on 27.08.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userListViewModel : UserListViewModel
    
    init() {
        self.userListViewModel = UserListViewModel(service: LocalService())
    }
    
    var body: some View {
        
        List(userListViewModel.userList,id: \.id){ user in
            VStack{
                Text(user.name).foregroundColor(Color.blue).frame(maxWidth:.infinity,alignment: .leading)
                Text(user.username).foregroundColor(Color.green)
                    .frame(maxWidth:.infinity,alignment: .leading)
                Text(user.email).frame(maxWidth:.infinity,alignment: .leading)
            }
        }.task {
           await userListViewModel.downloadUsers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
