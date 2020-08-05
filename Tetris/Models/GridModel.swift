// 网格模型(20 * 10)
// Created by 翁诚 on 2020/7/31.
// Copyright (c) 2020 adeng. All rights reserved.
//

import SwiftUI

struct GridModel {

    var lineArray: [LineModel] = []

    init(_ widthNum: Int, _ heightNum: Int) {
        for y in 0..<heightNum {
            lineArray.append(LineModel(y, widthNum: widthNum))
        }
        print("GridModel.init() 初始化完成")
    }

    mutating func restart() {
        // 使用 Array.enumerated() 可以同时拿到 下标和 let 的对象
        for (lineIndex, _) in lineArray.enumerated() {
            for (cubeIndex, _) in lineArray[lineIndex].lineArray.enumerated() {
                lineArray[lineIndex].lineArray[cubeIndex].color = Color.white
                lineArray[lineIndex].lineArray[cubeIndex].canMove = 1
            }
        }
    }

    mutating func setColor(_ x: Int, _ y: Int, _ color: Color) {
        lineArray[y].lineArray[x].color = color
    }

    mutating func setCanMover(x: Int, y: Int, canMove: Int) {
        lineArray[y].lineArray[x].canMove = canMove
    }

    /**
        判断节点的 canMove 是否是 0
    */
    func isCanNotMove(_ x: Int, _ y: Int) -> Bool {
        lineArray[y].lineArray[x].canMove == 0
    }
}
