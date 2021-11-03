//
//  CircleImage.swift
//  SwiftUIDemo
//
//  Created by Daniel No on 11/2/21.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("shib", bundle: .main).clipShape(Capsule()).overlay(Capsule().stroke(Color.white, lineWidth: 5)).shadow(color: Color.green, radius: 50, x: 0, y: 0)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
