//  Created by 아라 on 2023/05/09.
//  소요시간 : 0.00038909912109375

import Foundation

public func checkTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    return diff
}

func solution(_ targets:[[Int]]) -> Int {
    var answer = 0
    let target = targets.sorted{$0[1] == $1[1] ? $0[0] < $1[0] : $0[1] < $1[1]}
    var pre = -1
    
    for i in 0..<target.count {
        if target[i][0] >= pre {
            answer += 1
            pre = target[i][1]
        }
    }
    
    return answer
}

print(checkTime {
    print(solution([[4,5],[4,8],[10,14],[11,13],[5,12],[3,7],[1,4]]))
})
