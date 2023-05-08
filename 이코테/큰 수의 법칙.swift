//  Created by 아라 on 2023/05/08.
//

import Foundation

// 입력값
let nmkValues = readLine()!.split(separator: " ").map { Int($0)! }
let N = nmkValues[0]
let M = nmkValues[1]
let K = nmkValues[2]
let input = readLine()!.split(separator: " ").map { Int($0)! }

var answer = 0
let data = input.sorted(by: >)
var cnt = 1

while cnt <= M {
    if cnt % (K+1) != 0  {
        answer += data[0]
    } else {
        answer += data[1]
    }
    cnt += 1
}

print(answer)
