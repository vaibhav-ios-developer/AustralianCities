//
//  SearchBar.swift
//  AustralianCities
//
//  Created by Vaibhav  Uttekar on 07/02/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.blue)
                
                TextField("Search cities", text: $text)
                    .textFieldStyle(.plain)
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(UIConstants.cardGradient)
                    )
            }
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(.ultraThinMaterial)
                    .shadow(radius: 5)
            )
        }
}

#Preview {
    SearchBar(text: .constant(""))
}
