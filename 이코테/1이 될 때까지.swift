//  Created by 아라 on 2023/05/08.
//  소요시간 : 0.00019299983978271484

import Foundation

public func checkTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    return diff
}
func solution(_ n: Int, _ k: Int) -> Int {
    var n = n
    var answer = 0
    
    while n != 1 {
        if n % k == 0 {
            n /= k
        } else {
            n -= 1
        }
        answer += 1
    }
    return answer
}

print(checkTime {
    print(solution(25, 5))
})
