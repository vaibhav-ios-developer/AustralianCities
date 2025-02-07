//
//  CityRow.swift
//  AustralianCities
//
//  Created by Vaibhav  Uttekar on 07/02/25.
//

import SwiftUI

struct CityRow: View {
    let city: City
       
       var body: some View {
           VStack(alignment: .leading, spacing: 4) {
               Text(city.city)
                   .font(.headline)
               Text("Population: \(formatPopulation(city.population))")
                   .font(.subheadline)
                   .foregroundColor(.secondary)
           }
           .padding(.vertical, 4)
       }
       
       private func formatPopulation(_ population: String) -> String {
           guard let number = Int(population) else { return population }
           let formatter = NumberFormatter()
           formatter.numberStyle = .decimal
           return formatter.string(from: NSNumber(value: number)) ?? population
       }
}

//#Preview {
//    CityRow()
//}
