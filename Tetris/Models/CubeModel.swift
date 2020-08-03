// 方块模型
// Created by 翁诚 on 2020/7/31.
// Copyright (c) 2020 adeng. All rights reserved.
//

import Foundation

struct CubeModel: Identifiable {

    var id: String

    var x: Int
    var y: Int

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
        self.id = String.init(y) + "-" + String.init(x)
    }
}