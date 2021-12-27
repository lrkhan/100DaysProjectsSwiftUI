//
//  DisableView.swift
//  CupcakeCorner
//
//  Created by Luthfor Khan on 12/26/21.
//

import SwiftUI

struct DisableView: View {
    @State private var username = ""
    @State private var email = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account…")
                }
            }
            .disabled(disableForm)
            
        }
    }
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
}

struct DisableView_Previews: PreviewProvider {
    static var previews: some View {
        DisableView()
    }
}
