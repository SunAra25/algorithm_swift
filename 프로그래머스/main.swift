//  Created by 아라 on 2023/05/09.
//  소요시간 : 0.0003820657730102539

import Foundation

public func checkTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    return diff
}

func solution(_ d:[Int], _ budget:Int) -> Int {
    var answer = 0
    var budget = budget
    
    for i in d.sorted() {
        if budget - i < 0 {
            break
        }
        budget -= i
        answer += 1
    }
    return answer
}

print(checkTime {
    print(solution([1,3,2,5,4], 9))
})
