//
// Created by 翁诚 on 2020/7/31.
// Copyright (c) 2020 adeng. All rights reserved.
//

import SwiftUI

class PreGridViewModel: ObservableObject {

    var widthNum: Int
    var heightNum: Int
    @Published private var preGridModel: PreGridModel
    private var graphModel: GraphModel?

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
        graphModel = GraphModel()

        // 清空其他颜色
        preGridModel.clearColor()
        // 填充表格
        self.fillColor()
    }

    private func fillColor() {
        for index in self.graphModel!.array {
            var preCubeModel = index
            preGridModel.setColor(preCubeModel.x, preCubeModel.y, preCubeModel.color)
        }
    }

    // 图形变形
    func deform() {
        // TODO 变形

    }
}

