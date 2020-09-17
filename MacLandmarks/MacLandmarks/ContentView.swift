//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Keita Shiga on 2020/09/08.
//  Copyright © 2020 Keita Shiga. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedLandmark: Landmark?
    
    var body: some View {
        NavigationView {
            // バインディングを渡しているのは、NagivationPrimaryなどのサブビューで値を変更する必要があるから
            NavigationPrimary(selectedLandmark: $selectedLandmark)
            if selectedLandmark != nil {
                // 通常の値渡しにしているのは、読み取って表示するだけだから
                NavigationDetail(landmark: selectedLandmark!)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData())
    }
}
