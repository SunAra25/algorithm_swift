//  Created by 아라 on 2023/05/13.
//

import Foundation

public func checkTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    return diff
}

func solution(_ n: Int, _ plan: [String]) -> [Int] {
    var x = 1
    var y = 1
    let dx = [0,0,-1,1]
    let dy = [1,-1,0,0]
    let type = ["D","U","L","R"]
    
    for p in plan {
        let idx: Int
        switch p {
        case "R" : idx = 3
        case "L" : idx = 2
        case "U" : idx = 1
        case "D" : idx = 0
        default :
            idx = -1
        }
        if x + dx[idx] > n || x + dx[idx] < 1 || y + dy[idx] > n || y + dy[idx] < 1 {
            continue
        }
        
        x += dx[idx]
        y += dy[idx]
    }
    return [y,x]
}

print(checkTime {
    print(solution(5, ["R","R","R","U","D","D"]))
})

