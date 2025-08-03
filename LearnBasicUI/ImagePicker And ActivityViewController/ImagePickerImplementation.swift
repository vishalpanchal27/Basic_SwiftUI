//
//  ImagePickerImplementation.swift
//  LearnBasicUI
//
//  Created by Vishal Panchal on 02/08/25.
//

import SwiftUI

struct ImagePickerImplementation: View {
    
    @State private var currentImage: UIImage? = UIImage(named: "Placeholder")
    @State private var showPhotoLibrary: Bool = false
    @State private var showShareSheet: Bool = false
    
    var body: some View {
        VStack {
            
            Spacer()
            
            if let img = currentImage {
                Image(uiImage: img)
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 400)
                    .border(Color.blue)
            } else {
                Text("No Image Selected")
            }

            Spacer()
            
            HStack {
                Button("Select Image") {
                    showPhotoLibrary.toggle()
                }
                
                .sheet(isPresented: $showPhotoLibrary, content: {
                    ImagePickerCoordinator(sourceType: .photoLibrary, selectedImage: $currentImage)
                })
                
                Spacer()
                
                Button("Share") {
                    showShareSheet.toggle()
                }
                
                .sheet(isPresented: $showShareSheet, content: {
                    if let img: UIImage = currentImage {
                        ActiviteControllerCoordinator(contents: [img])
                    }
                })
            }
            
            Spacer()
        }.padding()
      
    }
}

#Preview {
    ImagePickerImplementation()
}
