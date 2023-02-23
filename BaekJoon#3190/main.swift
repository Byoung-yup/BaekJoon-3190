//
//  main.swift
//  BaekJoon#3190
//
//  Created by 김병엽 on 2023/02/24.
//
// Reference: https://jiseok-zip.tistory.com/entry/SwiftBOJ-3190

import Foundation

func solution() {
    
    let N = Int(readLine()!)!
    let K = Int(readLine()!)!
    var board = Array(repeating: Array(repeating: 0, count: N), count: N)
    
    for _ in 0..<K {
        let apple = readLine()!.split(separator: " ").map { Int($0)! - 1 }
        board[apple[0]][apple[1]] = 2
    }
    
    let L = Int(readLine()!)!
    var move_dir = [Int: Int]()
    
    for _ in 0..<L {
        let data = readLine()!.split(separator: " ")
        move_dir[Int(data[0])!] = data[1] == "D" ? 1 : 3
    }
    
    let dx = [0, 1, 0, -1]
    let dy = [1, 0, -1, 0]
    
    func is_valid(_ x: Int, _ y: Int) -> Bool {
        return (0 <= x && x < N) && (0 <= y && y < N)
    }
    
    var cnt: Int = 0
    var snake: [(Int, Int)] = []
    snake.append((0, 0))
    board[0][0] = 1
    
    var x = 0
    var y = 0
    var d = 0
    
    while true {
        
        cnt += 1
        x = x + dx[d]
        y = y + dy[d]
        
        if !is_valid(x, y) || board[x][y] == 1 { break }
        
        if board[x][y] == 0 {
            snake.append((x, y))
            board[x][y] = 1
            let tail = snake.removeFirst()
            board[tail.0][tail.1] = 0
        }
        else if board[x][y] == 2 {
            snake.append((x, y))
            board[x][y] = 1
        }
        
        for (key, value) in move_dir {
            if cnt == key { d = (d + value) % 4 }
        }
    }
    
    print(cnt)
}

solution()
