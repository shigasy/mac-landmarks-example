//
//  Home.swift
//  Landmarks
//
//  Created by Keita Shiga on 2020/09/11.
//  Copyright © 2020 Keita Shiga. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarkData, by: { $0.category.rawValue}
        )
    }
    
    // self.favorites[true]でtrueにカテゴライズされたものを表示できる
    var favorites: [Bool: [Landmark]] {
        Dictionary(
            grouping: userData.landmarks, by: { $0.isFavorite }
        )
    }
    
    var featured: [Landmark] {
        landmarkData.filter { $0.isFeatured }
    }
    
    @State var showingProfile = false
    @EnvironmentObject var userData: UserData
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                FeaturedLandmarks(landmarks: featured)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                if self.favorites[true]?.count ?? 0 >= 1 {
                    CategoryRow(categoryName: "Favorites", items: self.favorites[true]!)
                        .padding(.bottom, 8)
                        .listRowInsets(EdgeInsets())
                }
                
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
                .padding(.bottom, 8)
                .listRowInsets(EdgeInsets())
                NavigationLink(destination: LandmarkList()) {
                    Text("See all landmark")
                }
                
            }
            .navigationBarTitle(Text("Featured"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                ProfileHost().environmentObject(self.userData)
            }
        }
    }
}

struct FeaturedLandmarks: View {
    var landmarks: [Landmark]
    var body: some View {
        landmarks[0].image.resizable()
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome().environmentObject(UserData())
    }
}
