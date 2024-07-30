//
//  CheckBoxView.swift
//  CommuterList
//
//  Created by Christopher Cordero on 7/24/24.
//

import SwiftUI

struct CheckBoxView: View {
    
    let isChecked: Bool;
    
    var body: some View {
        Image(systemName: isChecked ? "checkmark.square.fill" : "square")
            .foregroundColor(isChecked ? Color(UIColor.systemBlue) : Color.secondary)
            .font(.headline)
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CheckBoxView(isChecked: true)
            CheckBoxView(isChecked: false)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
