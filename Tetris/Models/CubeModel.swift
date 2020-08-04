// 方块模型
// Created by 翁诚 on 2020/7/31.
// Copyright (c) 2020 adeng. All rights reserved.
//

import Foundation
import SwiftUI

struct CubeModel: Identifiable {

    var id: String
    var x: Int
    var y: Int
    var color: Color

    init(_ x: Int, _ y: Int, _ color: Color) {
        self.x = x
        self.y = y
        self.color = color
        self.id = String.init(y) + "-" + String.init(x)
    }

    mutating func setColor(_ color: Color) {
        self.color = color
    }
}