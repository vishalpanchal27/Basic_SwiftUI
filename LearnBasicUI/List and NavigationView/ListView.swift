//
//  ListView.swift
//  LearnBasicUI
//
//  Created by Vishal Panchal on 01/08/25.
//

import SwiftUI

struct StudentModel: Identifiable {
    var id: Int
    var name: String
}

struct ListView: View {
    @State private var students: [StudentModel] = [
        StudentModel(id: 0, name: "vishal"),
        StudentModel(id: 1, name: "Ekta"),
        StudentModel(id: 2, name: "rohan"),
        StudentModel(id: 3, name: "rohit"),
        StudentModel(id: 4, name: "no name"),
        
    ]
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(students) { student in
                    NavigationLink(destination: destinationVC()) {
                        Text("student name: \(student.name)")
                    }
                }.onDelete(perform: deleteItem)
                
            }.navigationTitle("Student List")
        }
        
    }
    
    func deleteItem(offset: IndexSet) {
        students.remove(atOffsets: offset)
    }
}

#Preview {
    ListView()
}
