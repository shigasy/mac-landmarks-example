//
//  Hike.swift
//  Landmarks
//
//  Created by Keita Shiga on 2020/09/10.
//  Copyright © 2020 Keita Shiga. All rights reserved.
//

import SwiftUI

// Codable API通信等で取得したJSONやプロパティリストを任意のデータ型に変換するプロトコル
// Hashble その型の値を元にハッシュ値が計算可能であることを表す型
// Identifiable Listとかでidなしに回せる
struct Hike: Codable, Hashable, Identifiable {
    var name: String
    var id: Int
    var distance: Double
    var difficulty: Int
    var observations: [Observation]

    static var formatter = LengthFormatter()
    
    var distanceText: String {
        return Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }

    struct Observation: Codable, Hashable {
        var distanceFromStart: Double
        
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
    }
}

