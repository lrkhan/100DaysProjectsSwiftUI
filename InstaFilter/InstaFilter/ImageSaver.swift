//
//  ImageSaver.swift
//  InstaFilter
//
//  Created by Luthfor Khan on 1/4/22.
//

import UIKit

class ImageSaver: NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }

    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}

/*
 Need to select Target and add permission to use camera
 
 Open your target settings
 Select the Info tab
 Right-click on an existing option
 Choose Add Row
 Select “Privacy - Photo Library Additions Usage Description” for the key name..
 Enter a reason - this will show up on the users end

 */
