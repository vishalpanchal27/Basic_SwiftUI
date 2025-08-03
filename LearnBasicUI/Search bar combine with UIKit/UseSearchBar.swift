//
//  UseSearchBar.swift
//  LearnBasicUI
//
//  Created by Vishal Panchal on 02/08/25.
//

import SwiftUI

struct ProductData: Identifiable {
    var id: Int = Int()
    var name: String = String()
}

struct UseSearchBar: View {
    @State private var searchText: String = String()
    @State private var productData: [ProductData] = [
        ProductData(id: 0, name: "Home"),
        ProductData(id: 1, name: "Home Decor"),
        ProductData(id: 2, name: "Home Services"),
        ProductData(id: 3, name: "Car"),
        ProductData(id: 4, name: "Car Wash"),
        ProductData(id: 5, name: "Car Service"),
        ProductData(id: 6, name: "GYM"),
        ProductData(id: 7, name: "GYM Equipment"),
        ProductData(id: 8, name: "GYM Trainer"),
        ProductData(id: 9, name: "Restaurant"),
        ProductData(id: 10, name: "Restaurant Deals"),
        ProductData(id: 11, name: "Restaurant Near Me"),
        ProductData(id: 12, name: "Books"),
        ProductData(id: 13, name: "Books Online"),
        ProductData(id: 14, name: "Book Store"),
        ProductData(id: 15, name: "Travel"),
        ProductData(id: 16, name: "Travel Deals"),
        ProductData(id: 17, name: "Travel Guide"),
        ProductData(id: 18, name: "Electronics"),
        ProductData(id: 19, name: "Electronics Deals"),
        ProductData(id: 20, name: "Electronics Store"),
        ProductData(id: 21, name: "Clothing"),
        ProductData(id: 22, name: "Clothing Men"),
        ProductData(id: 23, name: "Clothing Women"),
        ProductData(id: 24, name: "Food"),
        ProductData(id: 25, name: "Food Delivery"),
        ProductData(id: 26, name: "Food Recipes"),
        ProductData(id: 27, name: "Grocery")
    ]

        
    var body: some View {
        NavigationStack {
            VStack {
                SearchBarRepresentable(searchBarText: $searchText)
                List {
                    ForEach(productData.filter({searchText.isEmpty ? true : $0.name.contains(searchText)})) { product in
                        Text(product.name)
                    }
                }
            }.navigationTitle(Text("Search Bar"))
        }
    }
}

#Preview {
    UseSearchBar()
}
