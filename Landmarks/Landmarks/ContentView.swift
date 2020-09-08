//
//  ContentView.swift
//  Landmarks
//
//  Created by Keita Shiga on 2020/09/08.
//  Copyright © 2020 Keita Shiga. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            // SwiftUIのViewのメソッドとしてframeが用意されている
            // UIViewRepresentableはViewプロトコルを準拠している
            MapView().edgesIgnoringSafeArea(.top).frame(height: 300)
            // 画像を上に移動して、テキストのためのスペースを作成
            CircleImage().offset(y: -130).padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree national Park").font(.subheadline)
                    Spacer()
                    Text("California").font(.subheadline)
                }
            }.padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
