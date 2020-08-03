//
// Created by 翁诚 on 2020/7/31.
// Copyright (c) 2020 adeng. All rights reserved.
//

import SwiftUI

class GridViewModel: ObservableObject {

    var widthNum: Int
    var heightNum: Int
    @Published private var gridModel: GridModel

    init(widthNum: Int, heightNum: Int) {
        self.widthNum = widthNum
        self.heightNum = heightNum
        gridModel = GridModel(widthNum: self.widthNum, heightNum: self.heightNum)
    }

    func getAllLine() -> [LineModel] {
        gridModel.lineArray
    }
}

