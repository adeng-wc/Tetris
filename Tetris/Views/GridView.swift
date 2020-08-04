// 网格模型(20 * 10)
// Created by 翁诚 on 2020/7/31.
// Copyright (c) 2020 adeng. All rights reserved.
//

import SwiftUI

struct GridView: View {

    @ObservedObject var gridViewModel: GridViewModel
    @ObservedObject var preGridViewModel: PreGridViewModel

    init(_ gridViewModel: GridViewModel, _ preGridViewModel: PreGridViewModel) {
        self.gridViewModel = gridViewModel
        self.preGridViewModel = preGridViewModel
    }

    var body: some View {
        HStack {
            GeometryReader(content: { geometry in
                // 主网格
                VStack(spacing: 0) {
                    ForEach(self.gridViewModel.getAllLine()) { xArray in
                        self.body(line: xArray, geometry.size)
                    }
                }

                // 预览的网格
                PreGridView(self.preGridViewModel)
            })
        }
    }

    private func body(line lineModel: LineModel, _ size: CGSize) -> some View {
        HStack(spacing: 0) {
            ForEach(lineModel.lineArray) { item in
                self.body(item, size)
            }
        }
    }

    private func body(_ cubeModel: CubeModel, _ size: CGSize) -> some View {
        CubeView(cubeModel, size)
    }

}