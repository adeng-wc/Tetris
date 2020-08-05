//
// Created by 翁诚 on 2020/7/31.
// Copyright (c) 2020 adeng. All rights reserved.
//

import SwiftUI

class GridViewModel: ObservableObject {

    @Published private var gridModel: GridModel

    var preGridViewModel: PreGridViewModel?

    // 主网格中，可以移动的对象
    var graphModel: GraphModel?

    init(widthNum: Int, heightNum: Int) {
        gridModel = GridModel(widthNum, heightNum)
    }

    func setPreGridViewModel(_ preGridViewModel: PreGridViewModel) {
        self.preGridViewModel = preGridViewModel
    }

    func getAllLine() -> [LineModel] {
        gridModel.lineArray
    }

    // 将 预览的 图形，添加到主网格中
    func addToGrid(_ graphModel: GraphModel) {
        // 渲染成白色
        setGraphModelProperty(color: Color.white, addX: 0, addY: 0)
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
        fillGraphColor()
    }

    /**
        1. 将 graphModel 对象中的所有颜色 赋值
        2. 然后在 主网格中渲染
    */
    private func setGraphModelProperty(color: Color, addX: Int, addY: Int) {
        if self.graphModel != nil {
            for index in 0..<self.graphModel!.array.count {
                self.graphModel!.array[index].color = color
                if Int.zero != addX {
                    self.graphModel!.array[index].x = self.graphModel!.array[index].x + addX
                }
                if Int.zero != addY {
                    self.graphModel!.array[index].y = self.graphModel!.array[index].y + addY
                }
            }
            fillGraphColor()
        }
    }

    /**
        移动 主网格中的 形状
    */
    private func moveGraphInMainGrid(addX: Int, addY: Int) {
        // 将自己的位置变白色
        let colorOfGraph = self.graphModel!.array[0].color
        setGraphModelProperty(color: Color.white, addX: 0, addY: 0)
        // 下移一格，重新渲染
        setGraphModelProperty(color: colorOfGraph, addX: addX, addY: addY)

        if Int.zero != addX {
            self.graphModel!.x = self.graphModel!.x + addX
        }
        if Int.zero != addY {
            self.graphModel!.y = self.graphModel!.y + addY
        }
    }

    /**
        根据 移动 的 GraphModel 对象坐标，在主网格中渲染颜色
    */
    private func fillGraphColor() {
        for index in self.graphModel!.array {
            gridModel.setColor(index.x, index.y, index.color)
        }
    }

    func change() {
        print("向上按钮")
        let colorOfGraph = self.graphModel!.array[0].color

        // 先变白色
        setGraphModelProperty(color: Color.white, addX: 0, addY: 0)

        // 变形
        self.graphModel!.changeClockwise()

        // 先判断，能否下移
        for index in self.graphModel!.array {
            if index.x >= gridModel.lineArray[0].lineArray.count ||
                       index.y >= gridModel.lineArray.count ||
                       index.x < 0 {
                print("x, y 超边界")
                print("节点数组： \(self.graphModel!.array)")
                // 回退，重新赋值颜色
                self.graphModel!.changeCounterclockwise()
                print("节点数组： \(self.graphModel!.array)")
                setGraphModelProperty(color: colorOfGraph, addX: 0, addY: 0)
                return
            }

            // 下移所有节点，判断 canMove 是 0，
            if gridModel.isCanNotMove(index.x, index.y) {
                print("变形后方块会被占用")
                // 回退，重新赋值颜色
                print("节点数组： \(self.graphModel!.array)")
                self.graphModel!.changeCounterclockwise()
                print("节点数组： \(self.graphModel!.array)")
                setGraphModelProperty(color: colorOfGraph, addX: 0, addY: 0)
                return
            }
        }

        // 重新赋值颜色
        setGraphModelProperty(color: colorOfGraph, addX: 0, addY: 0)
    }

    func leftMove() {
        print("向左按钮")
        // 先判断，能否下移
        for index in self.graphModel!.array {
            // 达到最底层
            if (index.x - 1) < 0 {
                print("index.x - 1 < 0")
                return
            }

            // 下移所有节点，判断 canMove 是 0，
            if gridModel.isCanNotMove(index.x - 1, index.y) {
                print(" 左边 节点状态是 不能移动状态 ")
                return
            }
        }

        // 左移一格子
        moveGraphInMainGrid(addX: -1, addY: 0)
    }

    func rightMove() {
        print("向右按钮")
        // 先判断，能否下移
        for index in self.graphModel!.array {
            // 达到最底层
            if (index.x + 1) >= gridModel.lineArray[0].lineArray.count {
                print("index.x + 1 >= \(gridModel.lineArray[0].lineArray.count)")
                return
            }

            // 下移所有节点，判断 canMove 是 0，
            if gridModel.isCanNotMove(index.x + 1, index.y) {
                print(" 左边 节点状态是 不能移动状态 ")
                return
            }
        }

        // 将自己的位置变白色

        // 右移一格子
        moveGraphInMainGrid(addX: 1, addY: 0)
    }

    func downMove() {
        print("向下按钮")

        // 先判断，能否下移
        for index in self.graphModel!.array {
            // 达到最底层
            if (index.y + 1) == gridModel.lineArray.count {
                print("y + 1 == 最大y值：\(gridModel.lineArray.count)")

                // 设置不能移动
                setCanNotMove()
                // 到底后，添加一个新的图形到网格中
                preGridViewModel?.addToGrid()
                return
            }

            // 下移所有节点，判断 canMove 是 0，
            if gridModel.isCanNotMove(index.x, index.y + 1) {
                print(" 下方节点状态是 不能移动状态 ")
                // 设置不能移动
                setCanNotMove()
                // 到底后，添加一个新的图形到网格中
                preGridViewModel?.addToGrid()
                return
            }
        }

        // 下移一格子
        moveGraphInMainGrid(addX: 0, addY: 1)
    }

    /**
        根据 graphModel 的坐标，在主网格中，将对应坐标的 canMove 设置成 0 （表示 不能移动）
    */
    private func setCanNotMove() {
        for index in self.graphModel!.array {
            gridModel.setCanMover(x: index.x, y: index.y, canMove: 0)
        }
        self.graphModel = nil
    }
}

