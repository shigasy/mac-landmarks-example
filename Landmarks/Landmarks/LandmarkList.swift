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
    var body: some View {
        NavigationView {
            List(landmarkData) { landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }.navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
