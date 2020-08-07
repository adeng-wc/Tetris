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
            Divider()
            // 主网格视图
            GridView(self.gridViewModel).padding()
            // 预览的网格
            PreGridView(self.preGridViewModel).padding()
            Divider()
            //变形按钮视图
            VStack {
                VStack {
                    VStack {
                        Button(action: {
                            self.gridViewModel.restart()
                        }, label: { Text("重新开始") })
                        Divider()
                        HStack {
                            Button(action: {
                                self.gridViewModel.speedUp()
                            }, label: { Text("加速") })
                            Button(action: {
                                self.gridViewModel.speedDown()
                            }, label: { Text("减速") })
                        }
                    }
                    Divider()
                    VStack(alignment: .leading) {
                        Text("消除的行数：\(self.gridViewModel.getClearLineNum()) 行")
                        Text("本次游戏持续时间：\(self.gridViewModel.getGameTime()) 秒")
                    }
                    Divider()
                    Button(action: {
                        self.gridViewModel.change()
                    }, label: { Text("⬆️").font(Font.system(.largeTitle)) })
                }
            }
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
