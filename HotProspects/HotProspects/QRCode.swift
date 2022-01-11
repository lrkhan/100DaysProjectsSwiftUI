//
//  QRCode.swift
//  HotProspects
//
//  Created by Luthfor Khan on 1/10/22.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI
import Foundation

// needed for the code below - add to the view you need to generate the QR Code
let context = CIContext()
let filter = CIFilter.qrCodeGenerator()

func generateQRCode(from string: String) -> UIImage {
    filter.message = Data(string.utf8)

    if let outputImage = filter.outputImage {
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: cgimg)
        }
    }

    return UIImage(systemName: "xmark.circle") ?? UIImage()
}


/*
https://github.com/twostraws/CodeScanner
for the scanner
 */

/*
 Need to select Target and add permission to use camera
 
 Open your target settings
 Select the Info tab
 Right-click on an existing option
 Choose Add Row
 Select “Privacy - Camera Usage Description” for the key name.
 Enter a reason to use the camera - this will show up on the users end

 */
