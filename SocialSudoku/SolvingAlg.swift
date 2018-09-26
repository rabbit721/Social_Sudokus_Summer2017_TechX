//
//  SolvingAlg.swift
//  SocialSudoku
//
//  Created by Katrina Jiao on 08/08/2017.
//  Copyright © 2017 Katrina Jiao. All rights reserved.
//
import Foundation

class SolvingAlg{
    
    
    func solvable(board: [[Int]]) -> [[Int]] {
        var board = board
        var isSolved = false
        var sum = 0
        //var num = 0
        while !isSolved{
            var changed = false
            var track = [Int]()
            for x in 0 ..< 9  {
                for y in 0 ..< 9 {
                    if board[x][y] == 0 {
                        let known = Set(board.map { $0[y] } + board[x] + subgrid(board, pos: (x, y)))
                        //print(subgrid(board, pos: (x, y)))
                        let possible = Set(Array(1...9)).subtracting(known)
                        if possible.count == 1  {
                            board[x][y] = possible.first!
                            changed = true
                            print("changed")
                        }
                        //print("==: \(possible)")
                    }
                }
                track.append(board[x].reduce(0,+))
                
            }
            //num += 1
            sum = track.reduce(0,+)
            if sum == 45*9{
                break
            }
            
            if !changed{
                print("Unsolvable")
                break
            }
        }
        return board
    }
    
    func subgrid(_ board: [[Int]], pos: (Int, Int)) -> [Int] {
        var r = [Int]()
        var (x, y) = pos
        x = x / 3 * 3
        y = y / 3 * 3
        for i in x ..< x + 3 {
            for j in y ..< y + 3 {
                r.append(board[i][j])
            }
        }
        return r
    }
    
    func printSolution(_ board: [[Int]]) {
        for i in board.indices {
            if i % 9 == 0 {
                print(" -------------------")
            }
            for j in board.indices {
                if j % board.count == 0 {
                    print("| ", terminator: "")
                }
                let digit = board[i][j]
                print(digit != 0 ? digit : " ", terminator: "")
                print(" ", terminator: "")
            }
            print("|")
        }
        print(" -------------------")
    }
}
