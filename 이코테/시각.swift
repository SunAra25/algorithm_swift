//  Created by 아라 on 2023/05/13.
//

import Foundation

public func checkTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    return diff
}

func solution(_ n: Int) -> Int {
    var answer = 0
    
    for i in 0...n {
        for j in 0...59 {
            for k in 0...59 {
                if String(i).contains("3") || String(j).contains("3") || String(k).contains("3") {
                    answer += 1
                }
            }
        }
    }
    return answer
}

print(checkTime {
    print(solution(5))
})
