// 网格模型(20 * 10)
// Created by 翁诚 on 2020/7/31.
// Copyright (c) 2020 adeng. All rights reserved.
//

import SwiftUI

struct GridView: View {

    var widthNum: Int
    var heightNum: Int

    @ObservedObject var gridViewModel: GridViewModel

    init(widthNum: Int, heightNum: Int) {
        self.widthNum = widthNum
        self.heightNum = heightNum
        gridViewModel = GridViewModel(widthNum: self.widthNum, heightNum: self.heightNum)
    }

    var body: some View {
        VStack {
            GeometryReader(content: { geometry in
                // 调整间距
                VStack(spacing: 0) {
                    ForEach(self.gridViewModel.getAllLine()) { xArray in
                        self.body(line: xArray, for: geometry.size)
                    }
                }
            })
        }
    }

    private func body(line lineModel: LineModel, for size: CGSize) -> some View {
        HStack(spacing: 0) {
            ForEach(lineModel.lineArray) { item in
                self.body(cube: item, for: size)
            }
        }
    }

    private func body(cube cubeModel: CubeModel, for size: CGSize) -> some View {
        CubeView(for: size)
    }

}