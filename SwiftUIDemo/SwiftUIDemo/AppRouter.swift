//
//  AppRouter.swift
//  SwiftUIDemo
//
//  Created by Daniel No on 11/15/21.
//

import SwiftUI

enum RouterPath : Int, Hashable{
    case FirstTab
    case SecondTab
    case ThirdTab
    case FourthTab
    case FifthTab
    
}

class AppRouter : ObservableObject{
//    @Published var path : Int = RouterPath.SecondTab.rawValue
    @Published var path : Int = RouterPath.FirstTab.rawValue

}

