//
//  ImagePickerCoordinator.swift
//  LearnBasicUI
//
//  Created by Vishal Panchal on 02/08/25.
//

import Foundation
import SwiftUI

struct ImagePickerCoordinator: UIViewControllerRepresentable {
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    typealias UIViewControllerType = UIImagePickerController
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePickerCoordinator
        init(_ parent: ImagePickerCoordinator) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let userSelectedImage = info[.originalImage] as? UIImage {
                parent.selectedImage = userSelectedImage
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}
