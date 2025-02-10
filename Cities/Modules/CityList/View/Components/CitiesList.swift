//
//  CitiesList.swift
//  AustralianCities
//
//  Created by Vaibhav  Uttekar on 07/02/25.
//

import SwiftUI

struct CitiesList: View {
    @ObservedObject var viewModel: CitiesViewModel
    @State private var expandedSections = Set<String>()
    
    var body: some View {
        List {
            SearchBar(text: $viewModel.searchText)
            
            if viewModel.isLoading {
                ProgressView()
            } else {
                ForEach(viewModel.groupedCities, id: \.0) { section in
                    Section(
                        header: SectionHeader(
                            title: section.0,
                            isExpanded: expandedSections.contains(section.0),
                            action: { toggleSection(section.0) }
                        )
                    ) {
                        if expandedSections.contains(section.0) {
                            ForEach(section.1) { city in
                                CityRow(city: city)
                            }
                        }
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
    
    private func toggleSection(_ section: String) {
        if expandedSections.contains(section) {
            expandedSections.remove(section)
        } else {
            expandedSections.insert(section)
        }
    }
}


//#Preview {
//    CitiesList()
//}
