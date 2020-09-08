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
        VStack(alignment: .leading) {
            Text("Turtle Rock")
                .font(.title)
            HStack {
                Text("Joshua Tree national Park").font(.subheadline)
                Spacer()
                Text("California").font(.subheadline)
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
