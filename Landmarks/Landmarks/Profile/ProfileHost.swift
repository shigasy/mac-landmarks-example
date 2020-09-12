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
                if self.mode?.wrappedValue == .active {
                    Button("Cancel") {
                        // 非表示にした時、onDisappearが発火して、下書きをコピーするため、下書きを以前の最新のやつに
                        self.draftProfile = self.userData.profile
                        self.mode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                
                EditButton()
            }
            // SwiftUIのeditボタンで開いている判定
            if self.mode?.wrappedValue == .inactive {
                ProfileSummary(profile: draftProfile)
            } else {
                // ユーザーが編集モードを終了するまで編集が有効にならないようにするため
                // ユーザーが編集を確認したときにのみ、下書きコピーを実際のコピーに割り当てる
                // 編集中にはユーザーデータのコピーである下書き（ドラフト）を使用する
                ProfileEditor(profile: $draftProfile)
                    // このようにすることで、次に編集モードがアクティブになった時に古い値が表示されない
                    // 表示した時、下書きはuserData（最新のやつ）
                    .onAppear {
                        self.draftProfile = self.userData.profile
                }
                    // 非表示にした時、下書きはuserData(最新)は下書きにする
                    .onDisappear {
                        self.userData.profile = self.draftProfile
                }
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
