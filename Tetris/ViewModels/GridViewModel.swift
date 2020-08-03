//
// Created by 翁诚 on 2020/7/31.
// Copyright (c) 2020 adeng. All rights reserved.
//

import SwiftUI

class GridViewModel: ObservableObject {

    @Published private var gridModel: GridModel = GridModel()

    func getAllLine() -> [LineModel] {
        gridModel.lineArray
    }
}