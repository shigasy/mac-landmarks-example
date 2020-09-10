//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Keita Shiga on 2020/09/09.
//  Copyright © 2020 Keita Shiga. All rights reserved.
//

// Swiftでは名前空間は暗黙的であり、すべてのクラス（など）は、それらが含まれるモジュール（Xcodeターゲット）によって暗黙的にスコープされます。
// もし、名前空間が必要な場合に、importと指定すれば識別可能
import SwiftUI

struct LandmarkList: View {
    @State var showFavoritesOnly = false
    
    var body: some View {
        NavigationView {
            List {
                // $で状態変数へバインディングにアクセス
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                // ForEachを使う理由はListで動的ビューを表示すると、該当しないものが空行になるから
                ForEach(landmarkData) { landmark in
                    if !self.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }.navigationBarTitle(Text("Landmarks"))
            }
        }
    }
    
    struct LandmarkList_Previews: PreviewProvider {
        static var previews: some View {
            ForEach(["iPhone SE", "iPhone XS Max", "iPad Pro (12.9-inch)"], id: \.self) { deviceName in
                LandmarkList().previewDevice(
                    PreviewDevice(rawValue: deviceName )
                ).previewDisplayName(deviceName)
            }
        }
    }
}
