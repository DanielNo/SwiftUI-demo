//
//  Array+Extensions.swift
//  SwiftUIDemo
//
//  Created by Daniel No on 11/12/21.
//

import Foundation

// Extends Array to rawrepresentable so it integrates with SwiftUI's limitation on @AppStorage using Arrays
// Userdefaults works with Arrays, but swiftui's @Appstorage property wrapper currently does not
extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
