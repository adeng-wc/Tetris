//
// Created by 翁诚 on 2020/8/3.
// Copyright (c) 2020 adeng. All rights reserved.
//


import SwiftUI

// 预览方块网格
struct PreGridView: View {

    @ObservedObject var preGridViewModel: PreGridViewModel

    init(_ num: Int, _ gridViewModel: GridViewModel) {
        self.preGridViewModel = PreGridViewModel(num, num, gridViewModel)
    }

    var body: some View {
        VStack {
            GeometryReader(content: { geometry in
                // 调整间距
                VStack(spacing: 0) {
                    ForEach(self.preGridViewModel.getAllLine()) { lineModel in
                        self.body(line: lineModel, for: geometry.size)
                    }
                }
            })

            // 测试按钮
            Button(action: {
                self.preGridViewModel.randomGraph()
            }, label: { Text("随机生成方块") })

            // 测试变形
            Button(action: {
                self.preGridViewModel.change()
            }, label: { Text("方块变形") })

            // 预览形状添加到主网格
            Button(action: {
                self.preGridViewModel.addToGrid()
            }, label: { Text("添加到主网格中") })
        }
    }

    private func body(line lineModel: PreLineModel, for size: CGSize) -> some View {
        HStack(spacing: 0) {
            ForEach(lineModel.lineArray) { cube in
                self.body(cube, size)
            }
        }
    }

    private func body(_ cube: CubeModel, _ size: CGSize) -> some View {
        CubeView(cube, size)
    }

}