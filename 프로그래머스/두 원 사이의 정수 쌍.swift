//  Created by 아라 on 2023/05/13.
//  소요시간 : 0.00035190582275390625

import Foundation

public func checkTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    return diff
}

func solution(_ r1:Int, _ r2:Int) -> Int64 {
    var answer:Int64 = 0
    var minY = r1
    var maxY = r2
    
    for x in 0...r2 {
        while r2*r2 < maxY*maxY + x*x {
            maxY -= 1
        }
        
        while minY-1 > 0 && r1*r1 <= (minY-1)*(minY-1) + x*x {
            minY -= 1
        }
        
        answer += Int64(maxY-minY) + 1
    }
    return answer * 4
}

print(checkTime {
    print(solution(2,3))
})
