//
//  City.swift
//  AustralianCities
//
//  Created by Vaibhav  Uttekar on 07/02/25.
//

struct City: Codable, Identifiable {
    let city: String
    let lat: String
    let lng: String
    let country: String
    let iso2: String
    let admin_name: String
    let capital: String
    let population: String
    let population_proper: String
    
    var id: String { city }
}
