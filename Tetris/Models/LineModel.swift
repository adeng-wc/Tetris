// 一行 10 个方块
// Created by 翁诚 on 2020/7/31.
// Copyright (c) 2020 adeng. All rights reserved.
//

import Foundation

struct LineModel: Identifiable {

    var id: String
    // 一行10个方块
    let widthNum = 10;

    var lineArray: [CubeModel] = []
    var y: Int

    init(_ y: Int) {
        self.id = String.init(y) + "line"
        self.y = y
        for x in 1...widthNum {
            lineArray.append(CubeModel(x: x, y: y))
        }
    }
}