//
// Created by 翁诚 on 2020/8/3.
// Copyright (c) 2020 adeng. All rights reserved.
//

import Foundation
import SwiftUI

protocol GraphModel {
    var array: [CubeModel] { get set }
    var x: Int { get set }
    var y: Int { get set }
    var type: Int { get }
    var status: Int { get }
    // 顺时针变化
    mutating func changeClockwise()
    // 逆时针变化
    mutating func changeCounterclockwise()
}

extension GraphModel {
    func getType() -> Int {
        self.type
    }

    func getStatus() -> Int {
        self.status
    }

    func getArray() -> [CubeModel] {
        self.array
    }
}

/**
      1. 4格长条         蓝色
      固定点 是 第二个方块

*/
struct Type1: GraphModel {

    var type: Int = 1
    var status: Int = 1
    var array: [CubeModel] = []
    var x: Int = 0
    var y: Int = 1

    init(x: Int, y: Int, status: Int) {
        self.x = x
        self.y = y
        self.status = status
        changeByStatus()
    }

    mutating func changeByStatus() {
        if status == 1 {
            status1()
        } else {
            status2()
        }
    }

    mutating func changeClockwise() {
        if status == 1 {
            status2()
        } else {
            status1()
        }
    }

    mutating func changeCounterclockwise() {
        if status == 1 {
            status2()
        } else {
            status1()
        }
    }

    private mutating func status1() {
        print("1: 4格长条蓝色, 状态1")
        array = []
        status = 1
        array.append(CubeModel(x - 1, y, Color.blue))
        array.append(CubeModel(x, y, Color.blue))
        array.append(CubeModel(x + 1, y, Color.blue))
        array.append(CubeModel(x + 2, y, Color.blue))
    }

    private mutating func status2() {
        print("1: 4格长条蓝色, 状态2")
        array = []
        status = 2
        array.append(CubeModel(x, y - 1, Color.blue))
        array.append(CubeModel(x, y, Color.blue))
        array.append(CubeModel(x, y + 1, Color.blue))
        array.append(CubeModel(x, y + 2, Color.blue))
    }
}

//     2. 四格田          绿色
struct Type2: GraphModel {

    var type: Int = 2
    var status: Int = 1
    var array: [CubeModel] = []
    var x: Int = 0
    var y: Int = 1

    init(x: Int, y: Int, status: Int) {
        // 正常
        print("2: 四格田          绿色")
        array.append(CubeModel(x, y, Color.green))
        array.append(CubeModel(x + 1, y, Color.green))
        array.append(CubeModel(x, y + 1, Color.green))
        array.append(CubeModel(x + 1, y + 1, Color.green))
    }

    mutating func changeClockwise() {

    }

    mutating func changeCounterclockwise() {

    }
}

//      3. 四格 L          红色
struct Type3: GraphModel {

    var type: Int = 3
    var status: Int = 1
    var array: [CubeModel] = []

    var x: Int = 0
    var y: Int = 1

    init(x: Int, y: Int, status: Int) {
        self.x = x
        self.y = y
        self.status = status
        changeByStatus()
    }

    mutating func changeByStatus() {
        if status == 1 {
            status1()
        } else if status == 2 {
            status2()
        } else if status == 3 {
            status3()
        } else {
            status4()
        }
    }

    mutating func changeClockwise() {
        if status == 1 {
            y = y - 1
            status2()
        } else if status == 2 {
            x = x + 1
            status3()
        } else if status == 3 {
            y = y + 1
            status4()
        } else {
            x = x - 1
            status1()
        }
    }

    mutating func changeCounterclockwise() {
        if status == 1 {
            x = x + 1
            status4()
        } else if status == 2 {
            y = y + 1
            status1()
        } else if status == 3 {
            x = x - 1
            status2()
        } else {
            y = y - 1
            status3()
        }
    }

    private mutating func status1() {
        print("3: 四格 L          红色,状态1")
        array = []
        status = 1
        array.append(CubeModel(x, y, Color.red))
        array.append(CubeModel(x, y - 1, Color.red))
        array.append(CubeModel(x, y - 2, Color.red))
        array.append(CubeModel(x + 1, y, Color.red))
    }

    private mutating func status2() {
        print("3: 四格 L          红色，状态2")
        array = []
        status = 2
        array.append(CubeModel(x, y, Color.red))
        array.append(CubeModel(x, y + 1, Color.red))
        array.append(CubeModel(x + 1, y, Color.red))
        array.append(CubeModel(x + 2, y, Color.red))
    }

    private mutating func status3() {
        print("3: 四格 L          红色，状态3")
        array = []
        status = 3
        array.append(CubeModel(x, y, Color.red))
        array.append(CubeModel(x - 1, y, Color.red))
        array.append(CubeModel(x, y + 1, Color.red))
        array.append(CubeModel(x, y + 2, Color.red))
    }

    private mutating func status4() {
        print("3: 四格 L          红色，状态4")
        array = []
        status = 4
        array.append(CubeModel(x, y, Color.red))
        array.append(CubeModel(x, y - 1, Color.red))
        array.append(CubeModel(x - 1, y, Color.red))
        array.append(CubeModel(x - 2, y, Color.red))
    }
}

//       4. 四格 L翻转       黄色
struct Type4: GraphModel {

    var type: Int = 4
    var status: Int = 1
    var array: [CubeModel] = []

    var x: Int = 0
    var y: Int = 1

    init(x: Int, y: Int, status: Int) {
        self.x = x
        self.y = y
        self.status = status
        changeByStatus()
    }

    mutating func changeByStatus() {
        if status == 1 {
            status1()
        } else if status == 2 {
            status2()
        } else if status == 3 {
            status3()
        } else {
            status4()
        }
    }

    mutating func changeClockwise() {
        if status == 1 {
            x = x - 1
            status2()
        } else if status == 2 {
            y = y - 1
            status3()
        } else if status == 3 {
            x = x + 1
            status4()
        } else {
            y = y + 1
            status1()
        }
    }

    mutating func changeCounterclockwise() {
        if status == 1 {
            y = y - 1
            status4()
        } else if status == 2 {
            x = x + 1
            status1()
        } else if status == 3 {
            y = y + 1
            status2()
        } else {
            x = x - 1
            status3()
        }
    }

    private mutating func status1() {
        print("4: 四格 L翻转       黄色, 状态1")
        array = []
        status = 1
        array.append(CubeModel(x, y, Color.yellow))
        array.append(CubeModel(x - 1, y, Color.yellow))
        array.append(CubeModel(x, y - 1, Color.yellow))
        array.append(CubeModel(x, y - 2, Color.yellow))
    }

    private mutating func status2() {
        print("4: 四格 L翻转       黄色, 状态2")
        array = []
        status = 2
        array.append(CubeModel(x, y, Color.yellow))
        array.append(CubeModel(x, y - 1, Color.yellow))
        array.append(CubeModel(x + 1, y, Color.yellow))
        array.append(CubeModel(x + 2, y, Color.yellow))
    }

    private mutating func status3() {
        print("4: 四格 L翻转       黄色，状态3")
        array = []
        status = 3
        array.append(CubeModel(x, y, Color.yellow))
        array.append(CubeModel(x + 1, y, Color.yellow))
        array.append(CubeModel(x, y + 1, Color.yellow))
        array.append(CubeModel(x, y + 2, Color.yellow))
    }

    private mutating func status4() {
        print("4: 四格 L翻转       黄色，状态4")
        array = []
        status = 4
        array.append(CubeModel(x, y, Color.yellow))
        array.append(CubeModel(x - 1, y, Color.yellow))
        array.append(CubeModel(x - 2, y, Color.yellow))
        array.append(CubeModel(x, y + 1, Color.yellow))
    }
}

//        5. 4格 Z          紫色
struct Type5: GraphModel {

    var type: Int = 5
    var status: Int = 1
    var array: [CubeModel] = []

    var x: Int = 0
    var y: Int = 1

    init(x: Int, y: Int, status: Int) {
        self.x = x
        self.y = y
        self.status = status
        changeByStatus()
    }

    mutating func changeByStatus() {
        if status == 1 {
            status1()
        } else {
            status2()
        }
    }

    mutating func changeClockwise() {
        if status == 1 {
            status2()
        } else {
            status1()
        }
    }

    mutating func changeCounterclockwise() {
        if status == 1 {
            status2()
        } else {
            status1()
        }
    }

    private mutating func status1() {
        print("5: 4格 Z          紫色, 状态1")
        array = []
        status = 1
        array.append(CubeModel(x, y, Color.purple))
        array.append(CubeModel(x - 1, y - 1, Color.purple))
        array.append(CubeModel(x, y - 1, Color.purple))
        array.append(CubeModel(x + 1, y, Color.purple))
    }

    private mutating func status2() {
        print("5: 4格 Z          紫色, 状态2")
        array = []
        status = 2
        array.append(CubeModel(x, y, Color.purple))
        array.append(CubeModel(x + 1, y - 1, Color.purple))
        array.append(CubeModel(x + 1, y, Color.purple))
        array.append(CubeModel(x, y + 1, Color.purple))
    }
}

//      6. 4格 Z 翻转      橙色
struct Type6: GraphModel {

    var type: Int = 6
    var status: Int = 1
    var array: [CubeModel] = []
    var x: Int = 0
    var y: Int = 1

    init(x: Int, y: Int, status: Int) {
        self.x = x
        self.y = y
        self.status = status
        changeByStatus()
    }

    mutating func changeByStatus() {
        if status == 1 {
            status1()
        } else {
            status2()
        }
    }

    mutating func changeClockwise() {
        if status == 1 {
            status2()
        } else {
            status1()
        }
    }

    mutating func changeCounterclockwise() {
        if status == 1 {
            status2()
        } else {
            status1()
        }
    }

    private mutating func status1() {
        array = []
        status = 1
        print("6: 4格 Z 翻转      橙色,状态1")
        array.append(CubeModel(x, y, Color.orange))
        array.append(CubeModel(x - 1, y, Color.orange))
        array.append(CubeModel(x, y - 1, Color.orange))
        array.append(CubeModel(x + 1, y - 1, Color.orange))
    }

    private mutating func status2() {
        print("6: 4格 Z 翻转      橙色,状态2")
        array = []
        status = 2
        array.append(CubeModel(x, y, Color.orange))
        array.append(CubeModel(x, y + 1, Color.orange))
        array.append(CubeModel(x - 1, y, Color.orange))
        array.append(CubeModel(x - 1, y - 1, Color.orange))
    }
}

//       7. 4格 上 翻转      浅蓝
struct Type7: GraphModel {

    var type: Int = 7
    var status: Int = 1
    var array: [CubeModel] = []
    var x: Int = 0
    var y: Int = 1

    init(x: Int, y: Int, status: Int) {
        self.x = x
        self.y = y
        self.status = status
        changeByStatus()
    }

    mutating func changeByStatus() {
        if status == 1 {
            status1()
        } else if status == 2 {
            status2()
        } else if status == 3 {
            status3()
        } else {
            status4()
        }
    }

    mutating func changeClockwise() {
        if status == 1 {
            status2()
        } else if status == 2 {
            status3()
        } else if status == 3 {
            status4()
        } else {
            status1()
        }
    }

    mutating func changeCounterclockwise() {
        if status == 1 {
            status4()
        } else if status == 2 {
            status1()
        } else if status == 3 {
            status2()
        } else {
            status3()
        }
    }

    private mutating func status1() {
        print("7: 4格 上 翻转      浅蓝, 状态1")
        array = []
        status = 1
        array.append(CubeModel(x, y, Color.gray))
        array.append(CubeModel(x - 1, y, Color.gray))
        array.append(CubeModel(x, y - 1, Color.gray))
        array.append(CubeModel(x + 1, y, Color.gray))
    }

    private mutating func status2() {
        print("7: 4格 上 翻转      浅蓝, 状态2")
        array = []
        status = 2
        array.append(CubeModel(x, y, Color.gray))
        array.append(CubeModel(x, y - 1, Color.gray))
        array.append(CubeModel(x + 1, y, Color.gray))
        array.append(CubeModel(x, y + 1, Color.gray))
    }

    private mutating func status3() {
        print("7: 4格 上 翻转      浅蓝，状态3")
        array = []
        status = 3
        array.append(CubeModel(x, y, Color.gray))
        array.append(CubeModel(x - 1, y, Color.gray))
        array.append(CubeModel(x + 1, y, Color.gray))
        array.append(CubeModel(x, y + 1, Color.gray))
    }

    private mutating func status4() {
        print("7: 4格 上 翻转      浅蓝，，状态4")
        array = []
        status = 4
        array.append(CubeModel(x, y, Color.gray))
        array.append(CubeModel(x, y - 1, Color.gray))
        array.append(CubeModel(x, y + 1, Color.gray))
        array.append(CubeModel(x - 1, y, Color.gray))
    }
}


