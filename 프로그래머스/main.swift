//  Created by 아라 on 2023/05/08.
//  소요시간 : 0.0011448860168457031

import Foundation

public func checkTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    return diff
}

func solution(_ dartResult:String) -> Int {
    var scores = dartResult.split(whereSeparator: { !$0.isNumber }).compactMap { Int($0) }
    let letters = dartResult.split(whereSeparator: { $0.isNumber })
 
    for i in 0..<scores.count {
        let bonus = letters[i].first!
        let option = letters[i].last!
        
        switch bonus {
            case "D" : scores[i] = scores[i] * scores[i]
            case "T" : scores[i] = scores[i] * scores[i] * scores[i]
            default : scores[i] = scores[i]
        }
        if option == "*" {
            if i > 0 {
                scores[i-1] *= 2
            }
            scores[i] *= 2
        }
        if option == "#" {
            scores[i] *= -1
        }
    }
    
    return scores.reduce (0, +)
}

print(checkTime {
    print(solution("1S2D*3T"))
})
