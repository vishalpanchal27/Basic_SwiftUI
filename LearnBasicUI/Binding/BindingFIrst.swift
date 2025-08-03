//
//  BindingFIrst.swift
//  LearnBasicUI
//
//  Created by Vishal Panchal on 31/07/25.
//

import SwiftUI

struct BindingFIrst: View {
    
    @State private var isOn : Bool = false
    
    var body: some View {
        VStack {
            Text("Hello World!").foregroundStyle(isOn ? .red : .blue)
//            Toggle("", isOn: $isOn)
            toggleChildView(isOn: $isOn)
        }
    }
}

#Preview {
    BindingFIrst()
}
