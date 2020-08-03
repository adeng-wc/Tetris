//
// Created by 翁诚 on 2020/7/31.
// Copyright (c) 2020 adeng. All rights reserved.
//

import SwiftUI

class PreGridViewModel: ObservableObject {

    var widthNum: Int
    var heightNum: Int
    @Published private var preGridModel: PreGridModel
    private var graphModel: GraphModel = Type1()

    init(widthNum: Int, heightNum: Int) {
        self.widthNum = widthNum
        self.heightNum = heightNum
        preGridModel = PreGridModel(widthNum: self.widthNum, heightNum: self.heightNum)
    }

    func getAllLine() -> [PreLineModel] {
        preGridModel.lineArray
    }

    // 随机生成图形
    func randomGraph() {
        let type = Int.random(in: 1..<8)
        switch type {
        case 1:
            graphModel = Type1()
        case 2:
            graphModel = Type2()
        case 3:
            graphModel = Type3()
        case 4:
            graphModel = Type4()
        case 5:
            graphModel = Type5()
        case 6:
            graphModel = Type6()
        case 7:
            graphModel = Type7()
        default:
            print("默认 case")
        }
        // 填充表格
        self.fillColor()
    }

    private func fillColor() {
        // 清空其他颜色
        preGridModel.clearColor()
        // 填充表格
        for index in self.graphModel.array {
            preGridModel.setColor(index.x, index.y, index.color)
        }
    }

    // 图形变形
    func change() {
        self.graphModel.change()
        self.fillColor()
    }
}

