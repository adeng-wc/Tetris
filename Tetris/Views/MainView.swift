// 游戏主界面
// Created by 翁诚 on 2020/7/31.
// Copyright (c) 2020 adeng. All rights reserved.
//

import SwiftUI

struct MainView: View {

    @ObservedObject var gridViewModel: GridViewModel
    @ObservedObject var preGridViewModel: PreGridViewModel

    init() {
        var gridViewModel = GridViewModel(widthNum: 10, heightNum: 20)
        self.gridViewModel = gridViewModel
        self.preGridViewModel = PreGridViewModel(widthNum: 4, heightNum: 4, gridViewModel: gridViewModel)
        self.gridViewModel.setPreGridViewModel(self.preGridViewModel)
    }

    var body: some View {
        HStack {
            // 方向按钮视图
            SteeringWheelView(self.gridViewModel)

            // 主网格视图
            GridView(self.gridViewModel).padding()

            // 预览的网格
            PreGridView(self.preGridViewModel).padding()

            //变形按钮视图
            HStack {
                Button(action: {
                    self.gridViewModel.restart()
                }, label: { Text("重新开始") })
                Button(action: {
                    self.gridViewModel.speedUp()
                }, label: { Text("加速") })
                Button(action: {
                    self.gridViewModel.speedDown()
                }, label: { Text("减速") })
            }
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
