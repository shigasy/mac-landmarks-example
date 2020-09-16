//
//  NavigationPrimary.swift
//  MacLandmarks
//
//  Created by Keita Shiga on 2020/09/16.
//  Copyright © 2020 Keita Shiga. All rights reserved.
//

import SwiftUI

struct NavigationPrimary: View {
    @Binding var selectedLandmark: Landmark?
    @State private var filter: FilterType = .all
    
    var body: some View {
        VStack {
            Filter(filter: $filter)
                .controlSize(.small)
                .padding([.top, .leading], 8)
                .padding(.trailing, 4)
            
            LandmarkList(
                selectedLandmark: $selectedLandmark,
                filter: $filter
            )
            .listStyle(SidebarListStyle())
        }
        .frame(minWidth: 225, maxWidth: 300)
    }
}

struct NavigationPrimary_Previews: PreviewProvider {
    static var previews: some View {
        // envitonmentObjectに依存しているビュー（サブビュー）を使用するときは親でも宣言しなければならない。
        // 逆に必要となるのは良いね、依存しているViewが分かる
        NavigationPrimary(selectedLandmark: .constant(landmarkData[1])).environmentObject(UserData())
    }
}
