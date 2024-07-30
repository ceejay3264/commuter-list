//
//  ListItemView.swift
//  CommuterList
//
//  Created by Christopher Cordero on 7/24/24.
//

import SwiftUI

struct ListItemView: View {
    
    @ObservedObject var item: ListItem
    
    var body: some View {
        
            Button(action: { 
                withAnimation(.easeInOut(duration: 0.05)) {
                    item.completed.toggle()
                }
            }) {
                HStack (spacing: 8) {
                    CheckBoxView(isChecked: item.completed)
                    Text(item.name)
                        .foregroundStyle(Color.primary)
                        .font(.subheadline)
                    Spacer()
                }
                .padding(.vertical, 8)
            }
            
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(item: ListItem(name: "Buy dryer sheets", category: ""))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
