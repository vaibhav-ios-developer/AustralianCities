//
//  Contsants.swift
//  AustralianCities
//
//  Created by Vaibhav  Uttekar on 07/02/25.
//

import SwiftUICore

enum Constants {
    static let baseURL = "https://countryaustralia.com/api/cities" // Replace with actual API endpoint
    static let cacheKey = "cached_cities"
    static let cacheTimeout = 3600.0 // 1 hour
}

// MARK: - Network Error
enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case serverError(Int)
    case decodingError
    case unknown(Error)
    
    var description: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid response from server"
        case .invalidData:
            return "Invalid data received"
        case .serverError(let code):
            return "Server error with status code: \(code)"
        case .decodingError:
            return "Error decoding response"
        case .unknown(let error):
            return "Unknown error: \(error.localizedDescription)"
        }
    }
}

// MARK: - API Endpoint
enum APIEndpoint {
    case cities
    // Add more endpoints as needed
    
    var path: String {
        switch self {
        case .cities:
            return "/cities"
        }
    }
}

// MARK: - HTTPMethod
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}


// MARK: - UI Constants
enum UIConstants {
    static let backgroundGradient = LinearGradient(
            colors: [.blue.opacity(0.1), .purple.opacity(0.1)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        static let cardGradient = LinearGradient(
            colors: [.blue.opacity(0.2), .purple.opacity(0.2)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        static let headerGradient = LinearGradient(
            colors: [.blue.opacity(0.3), .purple.opacity(0.3)],
            startPoint: .leading,
            endPoint: .trailing
        )
        
        struct AnimationConfig {
            static let defaultSpring = Animation.spring(
                response: 0.5,
                dampingFraction: 0.7,
                blendDuration: 0
            )
            
            static let defaultEaseInOut = Animation.easeInOut(duration: 0.3)
            
            static let expandCollapse = Animation.spring(
                response: 0.4,
                dampingFraction: 0.8,
                blendDuration: 0
            )
            
            static let scroll = Animation.easeInOut(duration: 0.2)
        }
}
