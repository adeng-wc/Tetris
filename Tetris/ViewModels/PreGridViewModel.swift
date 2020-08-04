//
// Created by 翁诚 on 2020/7/31.
// Copyright (c) 2020 adeng. All rights reserved.
//

import SwiftUI

class PreGridViewModel: ObservableObject {

    var widthNum: Int
    var heightNum: Int
    @ObservedObject var gridViewModel: GridViewModel
    @Published private var preGridModel: PreGridModel
    private var graphModel: GraphModel

    init(widthNum: Int, heightNum: Int, gridViewModel: GridViewModel) {
        self.widthNum = widthNum
        self.heightNum = heightNum
        self.preGridModel = PreGridModel(widthNum: self.widthNum, heightNum: self.heightNum)
        self.gridViewModel = gridViewModel

        // 填充表格
        graphModel = Type1(x: 1, y: 1, status: 1)
        self.fillColor()
    }

    func getAllLine() -> [PreLineModel] {
        preGridModel.lineArray
    }

    // 随机生成图形
    func randomGraph() {
        let type = Int.random(in: 1..<8)
        switch type {
        case 1:
            graphModel = Type1(x: 1, y: 1, status: 1)
        case 2:
            graphModel = Type2(x: 1, y: 1, status: 1)
        case 3:
            graphModel = Type3(x: 1, y: 2, status: 1)
        case 4:
            graphModel = Type4(x: 2, y: 2, status: 1)
        case 5:
            graphModel = Type5(x: 1, y: 1, status: 1)
        case 6:
            graphModel = Type6(x: 1, y: 1, status: 1)
        case 7:
            graphModel = Type7(x: 1, y: 1, status: 1)
        default:
            print("默认 case")
        }
        // 填充表格
        self.fillColor()
    }

    // 将预览的图形添加到主网格
    func addToGrid() {
        // 移动到主网格
        gridViewModel.addToGrid(self.graphModel)
        // 随机生成一个新的
        randomGraph()
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

