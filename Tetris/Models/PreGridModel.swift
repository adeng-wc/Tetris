// 网格模型(20 * 10)
// Created by 翁诚 on 2020/7/31.
// Copyright (c) 2020 adeng. All rights reserved.
//

import SwiftUI

struct PreGridModel {

    var lineArray: [PreLineModel] = []

    init(widthNum: Int, heightNum: Int) {
        for y in 0..<heightNum {
            lineArray.append(PreLineModel(y, widthNum: widthNum))
        }
        print("PreGridModel.init() finish")
    }

    mutating func setColor(_ x: Int, _ y: Int, _ color: Color) {
        for lineIndex in 0..<lineArray.count {
            if (lineIndex == y) {
                for cubeIndex in 0..<lineArray[lineIndex].lineArray.count {
                    if (cubeIndex == x) {
                        lineArray[lineIndex].lineArray[cubeIndex].setColor(color)
                    }
                }
            }
        }
    }

    mutating func clearColor() {
        for lineIndex in 0..<lineArray.count {
            for cubeIndex in 0..<lineArray[lineIndex].lineArray.count {
                lineArray[lineIndex].lineArray[cubeIndex].setColor(Color.white)
            }
        }
    }
}
