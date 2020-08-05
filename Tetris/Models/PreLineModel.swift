// 一行 10 个方块
// Created by 翁诚 on 2020/7/31.
// Copyright (c) 2020 adeng. All rights reserved.
//

import Foundation
import SwiftUI

struct PreLineModel: Identifiable {

    var id: UUID = UUID()
    var lineArray: [CubeModel] = []
    var y: Int

    init(_ y: Int, widthNum: Int) {
        self.y = y
        for x in 0..<widthNum {
            lineArray.append(CubeModel(x, y, Color.white))
        }
    }
}