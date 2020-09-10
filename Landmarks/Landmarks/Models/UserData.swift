//
//  UserData.swift
//  Landmarks
//
//  Created by Keita Shiga on 2020/09/10.
//  Copyright © 2020 Keita Shiga. All rights reserved.
//

//import SwiftUI
import Combine

// ObservedObjectを利用すると、複数の値を状態管理でき、そういったプロパティをひとまとめにしたオブジェクトとして管理することができる
// クラスとして定義するため、複数のViewで使い回すことができる
// @ObservedObjectはそれぞれのViewで独立
// ViewModelとしての使い方が挙げられる
// 注意点としてViewの生成時に引数として渡す必要がある
// @Stateは単一のView内での状態管理に利用できる
// @EnvironmentObjectは利用するView全てで共通。共通のインスタンスを参照する。
final class UserData: ObservableObject {
    // また、監視するプロパティは@Publishedを付与します。
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
