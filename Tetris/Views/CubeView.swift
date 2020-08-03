// 方块
// Created by 翁诚 on 2020/7/31.
// Copyright (c) 2020 adeng. All rights reserved.
//

import SwiftUI

struct CubeView: View {

    // 正方形的长宽一直


    var body: some View {
        GeometryReader(content: { geometry in
            self.body(for: geometry.size)
        })
    }

    private func body(for size: CGSize) -> some View {
        // 用矩形做正方形处理
        Rectangle()
                .path(in: CGRect(
                        x: size.width,
                        y: 0,
                        width: size.height,
                        height: size.height)
                )
                .fill(Color.blue)
    }
}

