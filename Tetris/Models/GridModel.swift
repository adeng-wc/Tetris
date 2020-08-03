// 网格模型(20 * 10)
// Created by 翁诚 on 2020/7/31.
// Copyright (c) 2020 adeng. All rights reserved.
//


struct GridModel {

    var lineArray: [LineModel] = []

    init(widthNum widthNum: Int, heightNum: Int) {
        for y in 1...heightNum {
            lineArray.append(LineModel(y, widthNum: widthNum))
        }
        print(" grid init finish")
    }
}