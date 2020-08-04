//
// Created by 翁诚 on 2020/7/31.
// Copyright (c) 2020 adeng. All rights reserved.
//

import SwiftUI

class GridViewModel: ObservableObject {

    @Published private var gridModel: GridModel

    // 主网格中，可以移动的对象
    private var graphModel: GraphModel?

    init(_ widthNum: Int, _ heightNum: Int) {
        gridModel = GridModel(widthNum, heightNum)
    }

    func getAllLine() -> [LineModel] {
        gridModel.lineArray
    }

    // 将 预览的 图形，添加到主网格中
    func addToGrid(_  graphModel: GraphModel) {
        // 需要重新构建
        switch graphModel.getType() {
        case 1:
            self.graphModel = Type1(x: 4, y: 0, status: 1)
        case 2:
            self.graphModel = Type2(x: 4, y: 0, status: 1)
        case 3:
            self.graphModel = Type3(x: 4, y: 0, status: 2)
        case 4:
            self.graphModel = Type4(x: 4, y: 1, status: 2)
        case 5:
            self.graphModel = Type5(x: 5, y: 1, status: 1)
        case 6:
            self.graphModel = Type6(x: 5, y: 1, status: 1)
        case 7:
            self.graphModel = Type7(x: 5, y: 1, status: 1)
        default:
            print("默认 case")
        }

        fillColor()
    }

    private func fillColor() {
        // 填充表格
        for index in self.graphModel!.array {
            gridModel.setColor(index.x, index.y, index.color)
        }
    }
}

