//
//  ActiviteControllerCoordinator.swift
//  LearnBasicUI
//
//  Created by Vishal Panchal on 02/08/25.
//

import SwiftUI
import Foundation

struct ActiviteControllerCoordinator: UIViewControllerRepresentable {
    
    var contents: [Any] = []
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: contents, applicationActivities: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = UIActivityViewController
    
    
    
    
    
   
}

