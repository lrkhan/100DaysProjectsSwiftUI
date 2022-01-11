//
//  ImportSampleView.swift
//  HotProspects
//
//  Created by Luthfor Khan on 1/10/22.
//

import SamplePackage
import SwiftUI

struct ImportSampleView: View {
    let possibleNumbers = Array(1...60)
    
    var body: some View {
        Text(results)
    }
    
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        
        // Convert Int to string
        let strings = selected.map(String.init)
        
        return strings.joined(separator: ", ")
    }
}

struct ImportSampleView_Previews: PreviewProvider {
    static var previews: some View {
        ImportSampleView()
    }
}
