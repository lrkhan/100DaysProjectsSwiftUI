//
//  AlignmentView.swift
//  LayoutAndGeometry
//
//  Created by Luthfor Khan on 3/1/22.
//

import SwiftUI

extension VerticalAlignment {
    struct MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }

    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct AlignmentView: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@twostraws")
                    .alignmentGuide(.midAccountAndName){ d in
                        d[VerticalAlignment.center]
                    }
                Image("imageSushi")
                    .resizable()
                    .frame(width: 64, height: 64)
            }

            VStack {
                Text("Full name:")
                Text("PAUL HUDSON")
                    .font(.largeTitle)
                    .alignmentGuide(.midAccountAndName){ d in
                        d[VerticalAlignment.center]
                    }
            }
        }
    }
}

struct AlignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AlignmentView()
    }
}
