//  Created by 아라 on 2023/05/08.
//  소요시간 : 0.00048100948333740234

import Foundation

public func checkTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    return diff
}

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer = [String]()
    for i in 0..<n {
        let binary = String(arr1[i]|arr2[i], radix: 2)
        let tmp = String(repeating: "0", count: n - binary.count) + binary
        
        answer.append(tmp.map{$0=="0" ? " " : "#"}.reduce("",+))
    }
    return answer
}

print(checkTime {
    print(solution(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28]))
})
