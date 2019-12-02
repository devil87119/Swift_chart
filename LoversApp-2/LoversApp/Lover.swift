//
//  Lover.swift
//  LoversApp
//
//  Created by SHIH-YING PAN on 2019/11/13.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import Foundation


struct Lover: Identifiable, Codable {
    var id = UUID()
    var name: String
    var hours: Int
    var trueHeart: Bool
}

struct total {
    static var hr = 0
    static var pre_hr = 0
    static var temp = 0
    static var angle = 0.0
}

