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
        print(" grid init finish")
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
}
