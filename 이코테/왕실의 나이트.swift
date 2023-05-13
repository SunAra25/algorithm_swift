//  Created by 아라 on 2023/05/13.
//

import Foundation

public func checkTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    return diff
}

func solution(_ n: String) -> Int {
    var answer = 0
    let step = [[-2,-1],[-1,-2],[1,-2],[2,-1],[2,1],[1,2],[-1,2],[-2,1]]
    let alpha = ["a","b","c","d","e","f","g","h"]
    let row = alpha.firstIndex(of: String(n.first!))!
    let column = Int(String(n.last!))! - 1
    
    for s in step {
        if column + s[0] > 7 || column + s[0] < 0 || row + s[1] > 7 || row + s[1] < 0 {
            continue
        }
        answer += 1
    }
    return answer
}

print(checkTime {
    print(solution("c2"))
})
