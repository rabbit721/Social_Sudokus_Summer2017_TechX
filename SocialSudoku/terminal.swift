//
//  terminal.swift
//  
//
//  Created by Katrina Jiao on 08/08/2017.
//
//

import UIKit

//
//  PrepareTerminal.swift
//  SocialSudoku
//
//  Created by Katrina Jiao on 08/08/2017.
//  Copyright © 2017 Katrina Jiao. All rights reserved.
//

import Foundation
//Steps:
//
//1.Randomly locate n cells in an empty grid
//2.Fill these empty cells with random 1-to-9 while satisfy the game rules

//class PrepareTerminal creates and stores different Terminal Pattern in Cloud
class PrepareTerminal{
    //class PrepareTerminal creates and stores different Terminal Pattern in Cloud
    
    var terminal = ""
    let mBoardSize : Int = 9
    //let mBoxSize : Int = 3
    //index starting from 0
    var grid = [[Int]]()
    var statusTrack = [[Bool]]()
    //filled: true; empty: false
    
    init() {
        //mBoard = board
        
        //initiate grid for numbers and statusTrack to the whether the grid is filled
        grid = [[Int]](repeating: [Int](repeating: 0, count: mBoardSize), count: mBoardSize)
        statusTrack = [[Bool]](repeating: [Bool](repeating: false, count: mBoardSize), count: mBoardSize)
        
    }
    
    func fill(){
        while(!terminalDone()){
            randomCell()
        }
        var format = ""
        for r in 0...mBoardSize-1{
            for c in 0...mBoardSize-1{
                format.append("\(grid[r][c]),")
            }
            format.append("\n")
        }
    }
    
    
    //judge whether a number filling a cell in conflict with previous numbers
    func isValid(_ row : Int, _ col : Int, _ value : Int)->Bool{
        var status = !statusTrack[row][col]
        var rowValid = !grid[row].contains(value)
        var colValid = true
        for x in 0...mBoardSize-1{
            if grid[x][col] == value{
                colValid = false
                break
            }
        }
        return status && rowValid && colValid
    }
    
    func randomCell()->(Int,Int,Int)?{
        //generate a number in a random empty cell
        var suit = false
        var cell_row = 0
        var cell_col = 0
        var val = 0
        while(!suit){
            //randomly generate the location and value of the cell
            cell_row = Int(arc4random_uniform(9))
            cell_col = Int(arc4random_uniform(9))
            val = Int(arc4random_uniform(9))+1
            
            //judge whether a cell could fit in
            suit = isValid(cell_row, cell_col, val)
        }
        
        if cell_row * cell_col * val != 0{
            //update Array statusTrack and grid
            statusTrack[cell_row][cell_col] = true
            grid[cell_row][cell_col] = val
            return (cell_row, cell_col, val)
        }else{
            print("randomCell() : Function randomCell somehow generated a inValid Cell")
            return nil
        }
    }
    
    func terminalDone()-> Bool{
        for x in 0...mBoardSize{
            var b : [Bool] = statusTrack[x]
            if b.contains(false){
                return false
            }
        }
        return true
    }
}

let newTerminal = PrepareTerminal()
newTerminal.fill()
print(newTerminal.terminal)

