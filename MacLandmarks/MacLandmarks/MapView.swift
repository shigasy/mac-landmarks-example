//
//  MapView.swift
//  MacLandmarks
//
//  Created by Keita Shiga on 2020/09/16.
//  Copyright © 2020 Keita Shiga. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView {
    var coordinate: CLLocationCoordinate2D

    func makeMapView() -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateMapView(_ view: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}

// コンパイルディレクティブ
#if os(macOS)

// MapKitを使用。macOSではUIKitフレームワークは使えないから
// 継承のみではなくextemsionがあるのはこういう柔軟性が欲しかったんだろうなあ
extension MapView: NSViewRepresentable {
    func makeNSView(context: Context) -> MKMapView {
        makeMapView()
    }
    
    func updateNSView(_ nsView: MKMapView, context: Context) {
        updateMapView(nsView, context: context)
    }
}

#else

// こちらはUIKitのプロトコルを用いているので、UIKitが使えるデバイスで使用可能
extension MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        makeMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        updateMapView(uiView, context: context)
    }
}

#endif

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: landmarkData[0].locationCoordinate)
    }
}
