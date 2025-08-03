//
//  SearchBarRepresentable.swift
//  LearnBasicUI
//
//  Created by Vishal Panchal on 01/08/25.
//

//MARK: - Get the Search bar from the UIKit

import SwiftUI

struct SearchBarRepresentable: UIViewRepresentable {
  
    @Binding var searchBarText: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        @Binding var searchBarValue: String
        
        init(searchBarText: Binding<String>) {
            _searchBarValue = searchBarText
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            debugPrint("textDidChange")
            self._searchBarValue.wrappedValue = searchText
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(searchBarText: $searchBarText)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        debugPrint("makeUIView")
        let searchBar = UISearchBar(frame: .zero)
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        debugPrint("updateUIView")
        uiView.text = searchBarText
    }
    
    typealias UIViewType = UISearchBar
    
    
}

#Preview {
    SearchBarRepresentable(searchBarText: .constant(String()))
}
