//
//  ContentView.swift
//  Landmarks
//
//  Created by Keita Shiga on 2020/09/08.
//  Copyright © 2020 Keita Shiga. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    var body: some View {
        VStack {
            // SwiftUIのViewのメソッドとしてframeが用意されている
            // UIViewRepresentableはViewプロトコルを準拠している
            MapView(coordinate: landmark.locationCoordinate).edgesIgnoringSafeArea(.top).frame(height: 300)
            // 画像を上に移動して、テキストのためのスペースを作成
            CircleImage(Image: landmark.image).offset(y: -130).padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                HStack {
                    Text(landmark.park).font(.subheadline)
                    Spacer()
                    Text(landmark.state).font(.subheadline)
                }
            }.padding()
            Spacer()
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[1])
    }
}
