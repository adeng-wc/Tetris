// 网格模型(20 * 10)
// Created by 翁诚 on 2020/7/31.
// Copyright (c) 2020 adeng. All rights reserved.
//


struct GridModel {
    // 一个表格，20行
    let lineNum = 20;
    var lineArray: [LineModel] = []

    init() {
        for y in 1...lineNum {
            lineArray.append(LineModel(y))
        }
        print(" grid init finish")
    }
}