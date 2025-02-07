//
//  CacheService.swift
//  AustralianCities
//
//  Created by Vaibhav  Uttekar on 07/02/25.
//

import Foundation


protocol CacheServiceProtocol {
    func save(_ cities: [City]) throws
    func load() throws -> [City]?
    func clear()
    var isExpired: Bool { get }
}

class CacheService: CacheServiceProtocol {
    private let userDefaults: UserDefaults
    private let lastUpdateKey = "last_update_timestamp"
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    var isExpired: Bool {
        guard let lastUpdate = userDefaults.object(forKey: lastUpdateKey) as? Date else {
            return true
        }
        return Date().timeIntervalSince(lastUpdate) > Constants.cacheTimeout
    }
    
    func save(_ cities: [City]) throws {
        let encoder = JSONEncoder()
        let data = try encoder.encode(cities)
        userDefaults.set(data, forKey: Constants.cacheKey)
        userDefaults.set(Date(), forKey: lastUpdateKey)
    }
    
    func load() throws -> [City]? {
        guard let data = userDefaults.data(forKey: Constants.cacheKey) else {
            return nil
        }
        return try JSONDecoder().decode([City].self, from: data)
    }
    
    func clear() {
        userDefaults.removeObject(forKey: Constants.cacheKey)
        userDefaults.removeObject(forKey: lastUpdateKey)
    }
}
