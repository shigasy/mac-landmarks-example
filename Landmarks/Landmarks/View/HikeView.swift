//
//  HikeView.swift
//  Landmarks
//
//  Created by Keita Shiga on 2020/09/10.
//  Copyright © 2020 Keita Shiga. All rights reserved.
//

import SwiftUI

struct HikeView: View {
    //    var hike: HikeView
    @State private var showDetail = false
    
    var body: some View {
        VStack {
            HStack {
                //                HikeGraph()
                VStack(alignment: .leading) {
                    Text("name").font(.headline)
                    Text("distance")
                }
                Spacer()
                
                Button(action: {
                    self.showDetail.toggle()
                }) {
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .scaleEffect(showDetail ? 1.5 : 1)
                        // 間にnilを挟むと、その上のanimationは起きなくなる
//                        .animation(nil)
                        .padding()
                }
            }
            
            if showDetail {
                
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        HikeView()
    }
}
