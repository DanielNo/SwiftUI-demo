//
//  PieChart.swift
//  SwiftUIDemo
//
//  Created by Daniel No on 11/29/21.
//

import Foundation
import SwiftUI


struct PieChart : View{
    var body: some View{
        VStack{
            Spacer()
            PieView()
            Spacer()
        }.frame(width: 200, height: 200)
        

    }
    
    
}

struct PieView : InsettableShape{
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }


    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.inset(by: 10)
        
    }
    
    
}

struct PieChart_Preview : PreviewProvider{
    
    static var previews: some View {
        PieChart()
            .previewInterfaceOrientation(.portrait)
        
        
        PieChart()
            .previewInterfaceOrientation(.landscapeLeft)
    }

}
