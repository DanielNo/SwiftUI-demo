//
//  Pokemon.swift
//  SwiftUIDemo
//
//  Created by Daniel No on 11/9/21.
//

import Foundation

public struct Pokemon : Identifiable, Codable,Equatable{
    public var id : Int

    public static func == (lhs: Self, rhs: Self) -> Bool{
        return lhs.id == rhs.id
        
    }
}
