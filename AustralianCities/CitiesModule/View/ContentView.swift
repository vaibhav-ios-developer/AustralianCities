//
//  ContentView.swift
//  AustralianCities
//
//  Created by Vaibhav  Uttekar on 07/02/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CitiesViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                UIConstants.backgroundGradient
                    .ignoresSafeArea()
                
                CitiesList(viewModel: viewModel)
                    .navigationTitle("Australian Cities")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                withAnimation(UIConstants.AnimationConfig.defaultSpring) {
                                    viewModel.toggleOrder()
                                }
                            }) {
                                Image(systemName: "arrow.up.arrow.down")
                                    .foregroundStyle(.blue)
                            }
                        }
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                Task { await viewModel.loadCities() }
                            }) {
                                Image(systemName: "arrow.clockwise")
                                    .foregroundStyle(.blue)
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
