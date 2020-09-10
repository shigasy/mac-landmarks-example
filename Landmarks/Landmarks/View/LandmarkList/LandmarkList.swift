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
    // 利用するView全てで共通
    // 複数のプロパティを管理可能
    // 変更は監視され、変更時に宣言されたViewのbodyが再描画される
    @EnvironmentObject var userData: UserData
    
    
    var body: some View {
        NavigationView {
            List {
                // $で状態変数へバインディングにアクセス
                // Binding<Value>はポインタのようなもので、最新の値を取り出したり、値を変更したりすることができる -> Toggleを操作した結果を反映することが出きる
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }
                // ForEachを使う理由はListで動的ビューを表示すると、該当しないものが空行になるから
                // userData.landmarksではなく、
                // landmarkDataを渡すと、子ビューで変更しても更新されない。
                // なぜなら、ObservedObjectではなく、状態管理が出きないから。
                // 状態を持たないため、最初にjsonから読み込まれるlandmarkData初期値から変更されない。
                ForEach(userData.landmarks) { landmark in
                    // 参照だから$ではなく、self...
                    // $だとBoolではなく、Binding<Bool>になる。
                    // なぜselfが付いているかというと、クロージャの中で変数の参照を持つため、
                    // 循環参照になっていないかを意識させるためにSwiftの文法上の指定が必須。
                    if  !self.userData.showFavoritesOnly || landmark.isFavorite {
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
                LandmarkList().environmentObject(UserData()).previewDevice(
                    PreviewDevice(rawValue: deviceName )
                ).previewDisplayName(deviceName)
            }
        }
    }
}
