//
//  SectionHeader.swift
//  AustralianCities
//
//  Created by Vaibhav  Uttekar on 07/02/25.
//

import SwiftUI

struct SectionHeader: View {
    let title: String
       let isExpanded: Bool
       let action: () -> Void
       
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.blue)
                    .rotationEffect(.degrees(isExpanded ? 90 : 0))
                    .animation(UIConstants.AnimationConfig.defaultEaseInOut, value: isExpanded)
            }
           
            
        }
        
    }
}

#Preview {
    SectionHeader(
        title: "New South Wales",
        isExpanded: true,
        action: {}
    )
    .padding()
}

