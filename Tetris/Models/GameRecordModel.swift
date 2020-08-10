//
// Created by 翁诚 on 2020/8/10.
// Copyright (c) 2020 adeng. All rights reserved.
//

import Foundation

struct GameRecordModel: Codable {

    // 消除的行数
    var clearLineNum: Int?
    // 游戏开始时间
    var startTime: Date?
    // 游戏结束时间
    var endTime: Date?

    func getJson() -> Data? {
        try? JSONEncoder().encode(self)
    }

    init(clearLineNum: Int, startTime: Date, endTime: Date) {
        self.clearLineNum = clearLineNum
        self.startTime = startTime
        self.endTime = endTime
    }

    init?(json: Data?) {
        if json != nil, let record = try? JSONDecoder().decode(GameRecordModel.self, from: json!) {
            self = record
        } else {
            return nil
        }
    }

    init() {
    }
}