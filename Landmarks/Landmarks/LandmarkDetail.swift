//
//  ContentView.swift
//  Landmarks
//
//  Created by Keita Shiga on 2020/09/08.
//  Copyright © 2020 Keita Shiga. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    
    // アクセスまたは更新する時用
    // EnvironmentObjectのuserDataを参照しているため、常に正しいバージョンのデータにアクセスできる（配列が更新されたときなど）
    // また、idは1001など、配列を参照するデータではない
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id})!
    }
    
    var body: some View {
        VStack {
            // SwiftUIのViewのメソッドとしてframeが用意されている
            // UIViewRepresentableはViewプロトコルを準拠している
            MapView(coordinate: landmark.locationCoordinate).edgesIgnoringSafeArea(.top).frame(height: 300)
            // 画像を上に移動して、テキストのためのスペースを作成
            CircleImage(Image: landmark.image).offset(y: -130).padding(.bottom, -130)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    Button(action: {
                        self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                    }) {
                        // ListとDetail両方のViewが同じモデルオブジェクトを参照するため、2つのViewは一貫性を維持する
                        if self.userData.landmarks[landmarkIndex].isFavorite {
                            Image(systemName: "star.fill").foregroundColor(.yellow)
                        } else {
                            Image(systemName: "star").foregroundColor(.gray)
                        }
                    }
                }
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
        LandmarkDetail(landmark: landmarkData[1]).environmentObject(UserData())
    }
}
