//  Created by 아라 on 2023/05/13.
//

import Foundation

public func checkTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    return diff
}

func solution(_ position: [Int],_ game: [[Int]]) -> Int {
    var answer = 1 // 방문한 칸 수에 시작 위치 더하기
    var map = Array(repeating: Array(repeating: 0, count: game[0].count), count: game.count)
    let dx = [-1, 0, 1, 0]
    let dy = [0, 1, 0, -1]
    var x = position[0]
    var y = position[1]
    var direction = position[2]
    map[x][y] = 1   // 시작 위치 방문 체크
    var turn = 0
    
    while true {
        direction -= 1  // 왼쪽으로 회전
        if direction == -1 {
            direction = 3
        }
        
        // 현재 위치에서 회전한 방향으로 한칸 이동
        var nx = x + dx[direction]
        var ny = y + dy[direction]
        
        // 방문한 적 없고 육지라면 현재 변경
        if map[nx][ny] == 0 && game[nx][ny] == 0 {
            map[nx][ny] = 1
            x = nx
            y = ny
            answer += 1
            turn = 0
            continue
        }
        // 방문한 적 있거나 바다라면 한 번 더 회전
        else {
            turn += 1
        }
        // 한바퀴 다 돌았으면
        if turn == 4 {
            nx = x - dx[direction]
            ny = y - dy[direction]
            // 현재 방향에서 뒤로 한 칸 이동했을 때 육지라면 현재 위치 변경
            if game[nx][ny] == 0 {
                x = nx
                y = ny
            }
            // 바다라면 멈추기
            else {
                break
            }
            turn = 0
        }
    }
    
    return answer
}

print(checkTime {
    print(solution([1,1,0],[[1,1,1,1],[1,0,0,1],[1,1,0,1],[1,1,1,1]]))
})
