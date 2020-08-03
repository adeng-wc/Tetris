// 方块
// Created by 翁诚 on 2020/7/31.
// Copyright (c) 2020 adeng. All rights reserved.
//

import SwiftUI

struct CubeView: View {

    // 正方形的长宽一直
    var width: CGFloat
    // 视图颜色
    var color: Color?

    init(for size: CGSize) {
        // 根据屏幕长度，计算出方块的宽度
        width = size.height / 19
    }

    var body: some View {
        GeometryReader(content: { geometry in
            self.body(for: geometry.size)
        })
                // 指定大小
                .frame(width: width, height: width)
                // 边框
                .border(Color.black)
                // 透明度
                .opacity(0.5)
    }

    private func body(for size: CGSize) -> some View {
        // 用矩形做正方形处理
        Rectangle().fill(Color.white)

    }
}

