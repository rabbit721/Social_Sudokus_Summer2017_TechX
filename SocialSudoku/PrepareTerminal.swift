//
//  PrepareTerminal.swift
//  SocialSudoku
//
//  Created by Katrina Jiao on 08/08/2017.
//  Copyright © 2017 Katrina Jiao. All rights reserved.
//

import Foundation

class Terminal{
    static var terminal = [[8,2,5,4,7,1,3,9,6],
                      [1,9,4,3,2,6,5,7,8],
                      [3,7,6,9,8,5,2,4,1],
                      [5,1,9,7,4,3,8,6,2],
                      [6,3,2,5,9,8,4,1,7],
                      [4,8,7,6,1,2,9,3,5],
                      [2,6,3,1,5,9,7,8,4],
                      [9,4,8,2,6,7,1,5,3],
                      [7,5,1,8,3,4,6,2,9]]
    
    static var Arraysforterminal = [[[Int]]]()
    let mBoardSize : Int = 9
    var Givens = (28,31)
    var lowerBound = 2
    //sequence type: S shape
    //left-to-right, top-to-bottom
    
    static func generateTerminal(){
        Arraysforterminal.append(terminal)
        
        for field in 0..<3 {
            for i in 0 ..< 3{
                for j in i+1 ..< 3{
                    var newTerminal = terminal
                    for r in 0 ..< 9{
                        
                        var temp = newTerminal[r][i+field*3]
                        newTerminal[r][i+field*3] = newTerminal[r][j+field*3]
                        newTerminal[r][j+field*3] = temp
                        
                    }
                    Arraysforterminal.append(newTerminal)
                }
            }
        }
        
        //Arraysforterminal
    }

    
}
