// 方向盘
// Created by 翁诚 on 2020/7/31.
// Copyright (c) 2020 adeng. All rights reserved.
//

import SwiftUI

struct SteeringWheelView: View {

    var body: some View {
        VStack {
            HStack {
                Button(action: {}, label: { Text("⬆️") })
            }
            HStack {
                Button(action: {}, label: { Text("⬅️️") })
                Button(action: {}, label: { Text("➡️️") })
            }
            HStack {
                Button(action: {}, label: { Text("️⬇️") })
            }
        }
    }
}
