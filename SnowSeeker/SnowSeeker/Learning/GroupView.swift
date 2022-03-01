//
//  GroupView.swift
//  SnowSeeker
//
//  Created by Luthfor Khan on 3/1/22.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna and Arya")
        }
        .font(.title)
    }
}

struct GroupView: View {
    @State private var layoutVertically = false
    
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        //        Group {
        //            if layoutVertically {
        //                VStack {
        //                    UserView()
        //                }
        //            } else {
        //                HStack {
        //                    UserView()
        //                }
        //            }
        //        }
        //        .onTapGesture {
        //            layoutVertically.toggle()
        //        }
        if sizeClass == .compact {
            VStack(content: UserView.init)
        } else {
            HStack(content: UserView.init)
        }
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
.previewInterfaceOrientation(.portrait)
    }
}
