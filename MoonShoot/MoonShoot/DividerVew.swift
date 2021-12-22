//
//  DividerVew.swift
//  MoonShoot
//
//  Created by Luthfor Khan on 12/21/21.
//

import SwiftUI

struct DividerVew: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct DividerVew_Previews: PreviewProvider {
    static var previews: some View {
        DividerVew()
    }
}
