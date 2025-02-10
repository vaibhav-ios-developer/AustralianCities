//
//  CitiesViewModel.swift
//  AustralianCities
//
//  Created by Vaibhav  Uttekar on 07/02/25.
//

import Foundation

class CitiesViewModel: ObservableObject {
    @Published var cities: [City] = []
    @Published var isLoading = false
    @Published var error: Error?
    @Published var searchText = ""
    @Published var isReversed = false
    
    private let networkService: NetworkServiceProtocol
    private let cacheService: CacheServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService(),
         cacheService: CacheServiceProtocol = CacheService()) {
        self.networkService = networkService
        self.cacheService = cacheService
        Task { await loadCities() }
    }
    
    @MainActor
    func loadCities() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            if !cacheService.isExpired, let cached = try cacheService.load() {
                cities = cached
                return
            }
            
            let fetchedCities = try await networkService.fetchCities()
            try cacheService.save(fetchedCities)
            cities = fetchedCities
        } catch {
            self.error = error
        }
    }
    
    var groupedCities: [(String, [City])] {
        let filtered = cities.filter {
            searchText.isEmpty || $0.city.localizedCaseInsensitiveContains(searchText)
        }
        
        let grouped = Dictionary(grouping: filtered) { $0.admin_name }
            .map { ($0.key, $0.value) }
            .sorted { $0.0 < $1.0 }
        
        return isReversed ? grouped.reversed() : grouped
    }
    
    func toggleOrder() {
        isReversed.toggle()
    }
}
