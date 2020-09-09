//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Keita Shiga on 2020/09/09.
//  Copyright © 2020 Keita Shiga. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        // リストの行に近いサイズでプレビューの設定が可能
        // ビューの子はプレビュー構成など、ビューのコンテキスト設定を継承する
        Group {
            LandmarkRow(landmark: landmarkData[0])
            LandmarkRow(landmark: landmarkData[1])
        }.previewLayout(.fixed(width: 300, height: 70))
        
    }
}
