// 方块模型
// Created by 翁诚 on 2020/7/31.
// Copyright (c) 2020 adeng. All rights reserved.
//

import Foundation
import SwiftUI

struct CubeModel: Identifiable {

    let id: UUID = UUID()
    var x: Int
    var y: Int
    var color: Color
    // 0: 不能移动，1：可以移动
    var canMove: Int = 1

    init(_ x: Int, _ y: Int, _ color: Color) {
        self.x = x
        self.y = y
        self.color = color
    }
}