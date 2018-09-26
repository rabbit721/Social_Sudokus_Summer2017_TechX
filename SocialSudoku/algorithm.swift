//
//  algorithm.swift
//  SocialSudoku
//
//  Created by Katrina Jiao on 08/08/2017.
//  Copyright © 2017 Katrina Jiao. All rights reserved.
//

import Foundation
import CoreData

typealias TerminalPattern = [[Int]]

class algorithm{

    static func EvilSequence(_ terminal : [[Int]], _ Givens : (Int, Int), _ lowerBound : Int)->[[Int]]{
        var mutaBoard = terminal
        for x in 0 ..< 9  {
            for y in 0 ..< 9 {
                var temp = mutaBoard[x][y]
                mutaBoard[x][y] = 0
                if !solvable(board: mutaBoard){
                    mutaBoard[x][y] = temp
                }
            }
        }
        return mutaBoard
    }
    static func DifficultSequence(_ terminal : [[Int]], _ Givens : (Int, Int), _ lowerBound : Int) -> [[Int]]{
        var mutaBoard = terminal
        var blank = 0
        for x in 0 ..< 9  {
            if x % 2 == 0{
                for y in 0 ..< 9 {
                    var temp = mutaBoard[x][y]
                    mutaBoard[x][y] = 0
                    blank += 1
                    let rowUnk = Set(Array(1...9)).subtracting(Set(mutaBoard[x])).count
                    let colUnk = Set(Array(1...9)).subtracting(Set(mutaBoard.map { $0[y] })).count
                    let gridUnk = Set(Array(1...9)).subtracting(Set(subgrid(mutaBoard, pos: (x,y)))).count
                    
                    
                    if (!solvable(board: mutaBoard)) || rowUnk > 9-lowerBound || colUnk > 9-lowerBound || gridUnk > 9-lowerBound || 81-blank < Givens.0{
                        blank -= 1
                        mutaBoard[x][y] = temp
                    }
                    
                }
            }else{
                for y in 0 ..< 9 {
                    var c = 8 - y
                    var temp = mutaBoard[x][c]
                    mutaBoard[x][c] = 0
                    blank+=1
                    let rowUnk = Set(Array(1...9)).subtracting(Set(mutaBoard[x])).count
                    let colUnk = Set(Array(1...9)).subtracting(Set(mutaBoard.map { $0[c] })).count
                    // print(mutaBoard.map{ $0[c]})
                    let gridUnk = Set(Array(1...9)).subtracting(Set(subgrid(mutaBoard, pos: (x,c)))).count
                    
                    if (!solvable(board: mutaBoard)) || rowUnk > 9-lowerBound || colUnk > 9-lowerBound || gridUnk > 9-lowerBound || 81-blank < Givens.0{
                        mutaBoard[x][c] = temp
                        blank-=1
                    }
                    
                }
            }
        }
        return mutaBoard
    }
    

    static func solvable(board: [[Int]]) -> Bool {
        var board = board
        var sum = 0
        //var num = 0
        while true{
            var changed = false
            var track = [Int]()
            for x in 0 ..< 9  {
                for y in 0 ..< 9 {
                    if board[x][y] == 0 {
                        let known = Set(    board.map { $0[y] } + board[x] + subgrid(board, pos: (x, y))      )
                        //print(subgrid(board, pos: (x, y)))
                        let possible = Set(Array(1...9)).subtracting(known)
                        if possible.count == 1  {
                            board[x][y] = possible.first!
                            changed = true
                            //print("changed")
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
                //print("Unsolvable")
                return false
            }
            
        }
        //print("Solvable")
        return true
    }

    static func subgrid(_ board: [[Int]], pos: (Int, Int)) -> [Int] {
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

    static func EasySequence(_ terminal : [[Int]], _ Givens : (Int, Int), _ lowerBound : Int) -> [[Int]]{
        
        var mutaBoard = terminal
        var blank = 0
        var r = Int(arc4random_uniform(9))
        var a = Int(arc4random_uniform(9))
        for r in 0 ..< 9  {
            for a in 0 ..< 9 {
                var temp = mutaBoard[r][a]
                mutaBoard[r][a] = 0
                blank += 1
                let rowUnk = Set(Array(1...9)).subtracting(Set(mutaBoard[r])).count
                let colUnk = Set(Array(1...9)).subtracting(Set(mutaBoard.map { $0[a] })).count
                let gridUnk = Set(Array(1...9)).subtracting(Set(subgrid(mutaBoard, pos: (r,a)))).count
                
                if (!solvable(board: mutaBoard)) || rowUnk > 9-lowerBound || colUnk > 9-lowerBound || gridUnk > 9-lowerBound || 81-blank < Givens.0{
                    blank -= 1
                    mutaBoard[r][a] = temp
                }
            }
        }
        return mutaBoard
    }
    

    static func MediumSequence(_ terminal : [[Int]], _ Givens : (Int, Int), _ lowerBound : Int) -> [[Int]]{
        var mutaBoard = terminal
        var blank = 0
        for x in 0 ..< 9 {
            if x % 2 == 0{
                for y in 0 ..< 9 {
                    if y % 2 == 0{
                        var temp = mutaBoard[x][y]
                        mutaBoard[x][y] = 0
                        blank += 1
                        let rowUnk = Set(Array(1...9)).subtracting(Set(mutaBoard[x])).count
                        let colUnk = Set(Array(1...9)).subtracting(Set(mutaBoard.map{$0[y]})).count
                        let gridUnk = Set(Array(1...9)).subtracting(Set(subgrid(mutaBoard, pos: (x,y)))).count
                        if (!solvable(board: mutaBoard)) || rowUnk > 9-lowerBound || colUnk > 9-lowerBound || gridUnk > 9-lowerBound || 81-blank < Givens.0{
                            blank -= 1
                            mutaBoard[x][y] = temp
                            
                        }
                    }
                    else{
                        var c = 8 - y
                        var temp = mutaBoard[x][c]
                        mutaBoard[x][c] = 0
                        blank+=1
                        let rowUnk = Set(Array(1...9)).subtracting(Set(mutaBoard[x])).count
                        let colUnk = Set(Array(1...9)).subtracting(Set(mutaBoard.map{$0[c]})).count
                        let gridUnk = Set(Array(1...9)).subtracting(Set(subgrid(mutaBoard, pos: (x,c)))).count
                        
                        if (!solvable(board: mutaBoard)) || rowUnk > 9-lowerBound || colUnk > 9-lowerBound || gridUnk > 9-lowerBound || 81-blank < Givens.0{
                            mutaBoard[x][c] = temp
                            blank-=1
                            
                        }
                        
                    }
                }
            }else{
                for y in 0 ..< 9{
                    if y % 2 == 1{
                        var temp = mutaBoard[x][y]
                        mutaBoard[x][y] = 0
                        blank += 1
                        let rowUnk = Set(Array(1...9)).subtracting(Set(mutaBoard[x])).count
                        let colUnk = Set(Array(1...9)).subtracting(Set(mutaBoard.map{$0[y]})).count
                        let gridUnk = Set(Array(1...9)).subtracting(Set(subgrid(mutaBoard, pos: (x,y)))).count
                        if (!solvable(board: mutaBoard)) || rowUnk > 9-lowerBound || colUnk > 9-lowerBound || gridUnk > 9-lowerBound || 81-blank < Givens.0{
                            blank -= 1
                            mutaBoard[x][y] = temp
                            
                        }
                    }else{
                        var c = 8 - y
                        var temp = mutaBoard[x][c]
                        mutaBoard[x][c] = 0
                        blank+=1
                        let rowUnk = Set(Array(1...9)).subtracting(Set(mutaBoard[x])).count
                        let colUnk = Set(Array(1...9)).subtracting(Set(mutaBoard.map{$0[c]})).count
                        let gridUnk = Set(Array(1...9)).subtracting(Set(subgrid(mutaBoard, pos: (x,c)))).count
                        
                        if (!solvable(board: mutaBoard)) || rowUnk > 9-lowerBound || colUnk > 9-lowerBound || gridUnk > 9-lowerBound || 81-blank < Givens.0{
                            mutaBoard[x][c] = temp
                            blank-=1
                            
                        }
                        
                    }
                }
            }
            if 81-blank == Givens.0{
                break
            }
        }
        return mutaBoard
        
        
    }

    
}
