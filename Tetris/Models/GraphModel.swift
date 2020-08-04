//
// Created by 翁诚 on 2020/8/3.
// Copyright (c) 2020 adeng. All rights reserved.
//

import Foundation
import SwiftUI

protocol GraphModel {
    var array: [CubeModel] { get }
    mutating func change()
}

extension GraphModel {
    func getArray() -> [CubeModel] {
        self.array
    }
}

//      1. 4格长条         蓝色
struct Type1: GraphModel {

    var type: Int = 1
    var status: Int = 1
    var array: [CubeModel] = []

    init() {
        print("1: 4格长条         蓝色")
        status1()
    }

    mutating func change() {
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
        let x: Int = 0
        let y: Int = 1
        array.append(CubeModel(x, y, Color.blue))
        array.append(CubeModel(x + 1, y, Color.blue))
        array.append(CubeModel(x + 2, y, Color.blue))
        array.append(CubeModel(x + 3, y, Color.blue))
    }

    private mutating func status2() {
        print("1: 4格长条蓝色, 状态2")
        array = []
        status = 2
        let x: Int = 1
        let y: Int = 0
        array.append(CubeModel(x, y, Color.blue))
        array.append(CubeModel(x, y + 1, Color.blue))
        array.append(CubeModel(x, y + 2, Color.blue))
        array.append(CubeModel(x, y + 3, Color.blue))
    }
}

//     2. 四格田          绿色
struct Type2: GraphModel {

    var type: Int = 2
    var status: Int = 1
    var array: [CubeModel] = []

    init() {
        // 正常
        print("2: 四格田          绿色")
        let x: Int = 1
        let y: Int = 1
        array.append(CubeModel(x, y, Color.green))
        array.append(CubeModel(x + 1, y, Color.green))
        array.append(CubeModel(x, y + 1, Color.green))
        array.append(CubeModel(x + 1, y + 1, Color.green))
    }

    func change() {

    }
}

//      3. 四格 L          红色
struct Type3: GraphModel {

    var type: Int = 3
    var status: Int = 1
    var array: [CubeModel] = []

    init() {
        print("3: 四格 L          红色")
        status1()
    }

    mutating func change() {
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

    private mutating func status1() {
        print("3: 四格 L          红色,状态1")
        array = []
        status = 1
        let x: Int = 1
        let y: Int = 0
        array.append(CubeModel(x, y, Color.red))
        array.append(CubeModel(x, y + 1, Color.red))
        array.append(CubeModel(x, y + 2, Color.red))
        array.append(CubeModel(x + 1, y + 2, Color.red))
    }

    private mutating func status2() {
        print("3: 四格 L          红色，状态2")
        array = []
        status = 2
        let x: Int = 1
        let y: Int = 1
        array.append(CubeModel(x, y, Color.red))
        array.append(CubeModel(x, y + 1, Color.red))
        array.append(CubeModel(x + 1, y, Color.red))
        array.append(CubeModel(x + 2, y, Color.red))
    }

    private mutating func status3() {
        print("3: 四格 L          红色，状态3")
        array = []
        status = 3
        let x: Int = 1
        let y: Int = 1
        array.append(CubeModel(x, y, Color.red))
        array.append(CubeModel(x + 1, y, Color.red))
        array.append(CubeModel(x + 1, y + 1, Color.red))
        array.append(CubeModel(x + 1, y + 2, Color.red))
    }

    private mutating func status4() {
        print("3: 四格 L          红色，状态4")
        array = []
        status = 4
        let x: Int = 2
        let y: Int = 1
        array.append(CubeModel(x, y, Color.red))
        array.append(CubeModel(x, y + 1, Color.red))
        array.append(CubeModel(x - 1, y + 1, Color.red))
        array.append(CubeModel(x - 2, y + 1, Color.red))
    }
}

//       4. 四格 L翻转       黄色
struct Type4: GraphModel {

    var type: Int = 4
    var status: Int = 1
    var array: [CubeModel] = []

    init() {
        print("4: 四格 L翻转       黄色")
        status1()
    }

    mutating func change() {
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

    private mutating func status1() {
        print("4: 四格 L翻转       黄色, 状态1")
        array = []
        status = 1
        let x: Int = 2
        let y: Int = 0
        array.append(CubeModel(x, y, Color.yellow))
        array.append(CubeModel(x, y + 1, Color.yellow))
        array.append(CubeModel(x, y + 2, Color.yellow))
        array.append(CubeModel(x - 1, y + 2, Color.yellow))
    }

    private mutating func status2() {
        print("4: 四格 L翻转       黄色, 状态2")
        array = []
        status = 2
        let x: Int = 1
        let y: Int = 1
        array.append(CubeModel(x, y, Color.yellow))
        array.append(CubeModel(x, y + 1, Color.yellow))
        array.append(CubeModel(x + 1, y + 1, Color.yellow))
        array.append(CubeModel(x + 2, y + 1, Color.yellow))
    }

    private mutating func status3() {
        print("4: 四格 L翻转       黄色，状态3")
        array = []
        status = 3
        let x: Int = 1
        let y: Int = 1
        array.append(CubeModel(x, y, Color.yellow))
        array.append(CubeModel(x + 1, y, Color.yellow))
        array.append(CubeModel(x, y + 1, Color.yellow))
        array.append(CubeModel(x, y + 2, Color.yellow))
    }

    private mutating func status4() {
        print("4: 四格 L翻转       黄色，状态4")
        array = []
        status = 4
        let x: Int = 2
        let y: Int = 1
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

    init() {
        print("5: 4格 Z          紫色")
        status1()
    }

    mutating func change() {
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
        let x: Int = 0
        let y: Int = 1
        array.append(CubeModel(x, y, Color.purple))
        array.append(CubeModel(x + 1, y, Color.purple))
        array.append(CubeModel(x + 1, y + 1, Color.purple))
        array.append(CubeModel(x + 2, y + 1, Color.purple))
    }

    private mutating func status2() {
        print("5: 4格 Z          紫色, 状态2")
        array = []
        status = 2
        let x: Int = 1
        let y: Int = 2
        array.append(CubeModel(x, y, Color.purple))
        array.append(CubeModel(x + 1, y, Color.purple))
        array.append(CubeModel(x + 1, y - 1, Color.purple))
        array.append(CubeModel(x, y + 1, Color.purple))
    }
}

//      6. 4格 Z 翻转      橙色
struct Type6: GraphModel {

    var type: Int = 6
    var status: Int = 1
    var array: [CubeModel] = []

    init() {
        print("6: 4格 Z 翻转      橙色")
        status1()
    }

    mutating func change() {
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
        let x: Int = 0
        let y: Int = 2
        array.append(CubeModel(x, y, Color.orange))
        array.append(CubeModel(x + 1, y, Color.orange))
        array.append(CubeModel(x + 1, y - 1, Color.orange))
        array.append(CubeModel(x + 2, y - 1, Color.orange))
    }

    private mutating func status2() {
        print("6: 4格 Z 翻转      橙色,状态2")
        array = []
        status = 2
        let x: Int = 1
        let y: Int = 2
        array.append(CubeModel(x, y, Color.orange))
        array.append(CubeModel(x, y - 1, Color.orange))
        array.append(CubeModel(x + 1, y, Color.orange))
        array.append(CubeModel(x + 1, y + 1, Color.orange))
    }
}

//       7. 4格 上 翻转      浅蓝
struct Type7: GraphModel {

    var type: Int = 7
    var status: Int = 1
    var array: [CubeModel] = []

    init() {
        print("7: 4格 上 翻转      浅蓝")
        status1()
    }

    mutating func change() {
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

    private mutating func status1() {
        print("7: 4格 上 翻转      浅蓝, 状态1")
        array = []
        status = 1
        let x: Int = 1
        let y: Int = 0
        array.append(CubeModel(x, y, Color.gray))
        array.append(CubeModel(x - 1, y + 1, Color.gray))
        array.append(CubeModel(x, y + 1, Color.gray))
        array.append(CubeModel(x + 1, y + 1, Color.gray))
    }

    private mutating func status2() {
        print("7: 4格 上 翻转      浅蓝, 状态2")
        array = []
        status = 2
        let x: Int = 1
        let y: Int = 1
        array.append(CubeModel(x, y, Color.gray))
        array.append(CubeModel(x, y - 1, Color.gray))
        array.append(CubeModel(x + 1, y, Color.gray))
        array.append(CubeModel(x, y + 1, Color.gray))
    }

    private mutating func status3() {
        print("7: 4格 上 翻转      浅蓝，状态3")
        array = []
        status = 3
        let x: Int = 1
        let y: Int = 1
        array.append(CubeModel(x, y, Color.gray))
        array.append(CubeModel(x - 1, y, Color.gray))
        array.append(CubeModel(x + 1, y, Color.gray))
        array.append(CubeModel(x, y + 1, Color.gray))
    }

    private mutating func status4() {
        print("7: 4格 上 翻转      浅蓝，，状态4")
        array = []
        status = 4
        let x: Int = 1
        let y: Int = 1
        array.append(CubeModel(x, y, Color.gray))
        array.append(CubeModel(x, y - 1, Color.gray))
        array.append(CubeModel(x, y + 1, Color.gray))
        array.append(CubeModel(x - 1, y, Color.gray))
    }
}


