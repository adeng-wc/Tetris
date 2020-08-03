//
// Created by 翁诚 on 2020/8/3.
// Copyright (c) 2020 adeng. All rights reserved.
//

import Foundation
import SwiftUI

struct GraphModel {

    var type: Int
    var array: [CubeModel] = []
    // 有7种形状

    /*
     1. 4格长条         蓝色
     2. 四格田          绿色
     3. 四格 L          红色
     4. 四格 L翻转       黄色
     5. 4格 Z          紫色
     6. 4格 Z 翻转      橙色
     7. 4格 上 翻转      浅蓝
     */

    init() {
        type = Int.random(in: 1..<8)
        // 生成对应坐标
        self.makeArray(type)
    }

    private mutating func makeArray(_ type: Int) {
        switch type {
        case 1:
            // 正常
            print("1: 4格长条         蓝色")
            let x: Int = 0
            let y: Int = 1
            array.append(CubeModel(x, y, Color.blue))
            array.append(CubeModel(x + 1, y, Color.blue))
            array.append(CubeModel(x + 2, y, Color.blue))
            array.append(CubeModel(x + 3, y, Color.blue))
        case 2:
            // 正常
            print("2: 四格田          绿色")
            let x: Int = 1
            let y: Int = 1
            array.append(CubeModel(x, y, Color.green))
            array.append(CubeModel(x + 1, y, Color.green))
            array.append(CubeModel(x, y + 1, Color.green))
            array.append(CubeModel(x + 1, y + 1, Color.green))
        case 3:
            print("3: 四格 L          红色")
            let x: Int = 1
            let y: Int = 0
            array.append(CubeModel(x, y, Color.red))
            array.append(CubeModel(x, y + 1, Color.red))
            array.append(CubeModel(x, y + 2, Color.red))
            array.append(CubeModel(x + 1, y + 2, Color.red))
        case 4:
            print("4: 四格 L翻转       黄色")
            let x: Int = 2
            let y: Int = 0
            array.append(CubeModel(x, y, Color.yellow))
            array.append(CubeModel(x, y + 1, Color.yellow))
            array.append(CubeModel(x, y + 2, Color.yellow))
            array.append(CubeModel(x - 1, y + 2, Color.yellow))
        case 5:
            print("5: 4格 Z          紫色")
            let x: Int = 0
            let y: Int = 1
            array.append(CubeModel(x, y, Color.purple))
            array.append(CubeModel(x + 1, y, Color.purple))
            array.append(CubeModel(x + 1, y + 1, Color.purple))
            array.append(CubeModel(x + 2, y + 1, Color.purple))
        case 6:
            print("6: 4格 Z 翻转      橙色")
            let x: Int = 0
            let y: Int = 2
            array.append(CubeModel(x, y, Color.orange))
            array.append(CubeModel(x + 1, y, Color.orange))
            array.append(CubeModel(x + 1, y - 1, Color.orange))
            array.append(CubeModel(x + 2, y - 1, Color.orange))
        case 7:
            print("7: 4格 上 翻转      浅蓝")
            let x: Int = 1
            let y: Int = 0
            array.append(CubeModel(x, y, Color.gray))
            array.append(CubeModel(x - 1, y + 1, Color.gray))
            array.append(CubeModel(x, y + 1, Color.gray))
            array.append(CubeModel(x + 1, y + 1, Color.gray))
        default:
            print("默认 case")
        }
    }
}