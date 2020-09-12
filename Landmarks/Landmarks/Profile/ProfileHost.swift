//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Keita Shiga on 2020/09/11.
//  Copyright © 2020 Keita Shiga. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData

    @State var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Spacer()
                
                EditButton()
            }
            // SwiftUIのeditボタンで開いている判定
            if self.mode?.wrappedValue == .inactive {
                ProfileSummary(profile: draftProfile)
            } else {
                ProfileEditor(profile: $draftProfile)
            }
            
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost().environmentObject(UserData())
    }
}
