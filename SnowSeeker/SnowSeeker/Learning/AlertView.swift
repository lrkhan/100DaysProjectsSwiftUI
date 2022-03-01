//
//  AlertView.swift
//  SnowSeeker
//
//  Created by Luthfor Khan on 3/1/22.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct AlertView: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingUser = false
    
    var body: some View {
        Text("Hello, World!")
            .onTapGesture {
                selectedUser = User()
                isShowingUser = true
            }
//            .sheet(item: $selectedUser) { user in
//                Text(user.id)
//            }
            .alert("Welcome", isPresented: $isShowingUser) {
                //Button("OK") { }
            }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
