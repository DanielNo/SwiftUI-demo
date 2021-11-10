//
//  MapView.swift
//  SwiftUIDemo
//
//  Created by Daniel No on 11/2/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2DMake(34.011_286, -116.166_868), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
                                                              
                                                              
    @ObservedObject var test : TestObject = TestObject()
    
    
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

class TestObject : ObservableObject{
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
