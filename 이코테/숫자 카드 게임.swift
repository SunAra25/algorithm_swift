//  Created by 아라 on 2023/05/08.
//

import Foundation

public func checkTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    return diff
}

func solution(_ n: Int, _ m: Int, _ card: [[Int]]) -> Int {
    var max = -1
    card.forEach {
        if max < $0.min()! {
            max = $0.min()!
        }
    }
    return max
}

print(checkTime {
    print(solution(3, 3, [[3,1,2],[4,1,4],[2,2,2]]))
})
