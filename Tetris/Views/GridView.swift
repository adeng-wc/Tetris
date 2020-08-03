// 网格模型(20 * 10)
// Created by 翁诚 on 2020/7/31.
// Copyright (c) 2020 adeng. All rights reserved.
//

import SwiftUI

struct GridView: View {

    @ObservedObject var gridViewModel: GridViewModel = GridViewModel()

    var body: some View {
        VStack{
            ForEach(gridViewModel.getAllLine()) { xArray in
                self.body(line: xArray)
            }
        }
    }

    private func body(line lineModel: LineModel) -> some View {
        HStack {
            ForEach(lineModel.lineArray) { item in
                self.body(cube: item)
            }
        }
    }

    private func body(cube cubeModel: CubeModel) -> some View {
        CubeView()
    }

}