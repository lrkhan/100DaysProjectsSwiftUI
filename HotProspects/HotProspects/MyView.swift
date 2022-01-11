//
//  MyView.swift
//  HotProspects
//
//  Created by Luthfor Khan on 1/10/22.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct MyView: View {
    @State private var name = "Anonymous"
    @State private var emailAddress = "you@yoursite.com"
    
    @State private var qrCode = UIImage()
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                    .textContentType(.name)
                    .font(.title)
                
                TextField("Email address", text: $emailAddress)
                    .textContentType(.emailAddress)
                    .font(.title)
                Section {
                    HStack {
                        Spacer()
                        Image(uiImage: qrCode)
                            .interpolation(.none)
                            .resizable()
                            .scaledToFit()
                            .contextMenu {
                                Button {
                                    let imageSaver = ImageSaver()
                                    imageSaver.writeToPhotoAlbum(image: qrCode)
                                } label: {
                                    Label("Save to Photos", systemImage: "square.and.arrow.down")
                                }
                            }
                        Spacer()
                    }
                }
            }
            .navigationTitle("Your code")
            .onAppear(perform: updateCode)
            .onChange(of: name) {_ in
                updateCode()
            }
            .onChange(of: emailAddress) {_ in
                updateCode()
            }
        }
    }
    
    func updateCode() {
        qrCode = generateQRCode(from: "\(name)\n\(emailAddress)")
    }
    
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}
