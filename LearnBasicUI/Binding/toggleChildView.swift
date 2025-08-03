//
//  toggleChildView.swift
//  LearnBasicUI
//
//  Created by Vishal Panchal on 31/07/25.
//

import SwiftUI

struct toggleChildView: View {
    @Binding var isOn: Bool
	    var body: some View {
            Toggle(isOn: $isOn, label: {
                Text("Is Watching")
            }).fixedSize()
    }
}

#Preview {
    toggleChildView(isOn: .constant(false))
}
