//
//  NewGame.swift
//  SocialSudoku
//
//  Created by Katrina Jiao on 08/08/2017.
//  Copyright © 2017 Katrina Jiao. All rights reserved.
//

import Foundation
import UIKit
class NewGame : UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    static var gameLevel = "default"
    static var gameArray = [[Int]]()

//    var nextViewController : SolutionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let headerLabel = UILabel()
        headerLabel.frame = CGRect(x: 150, y: 50, width: 200, height:50)
        headerLabel.text = "Game Time"
        headerLabel.font = UIFont.boldSystemFont(ofSize: 28)
        self.view.addSubview(headerLabel)
        
        let button = UIButton(frame: CGRect(x: 130, y:620, width: 200, height: 44))
        button.setTitle("View Solution", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(switchViewControl), for: .touchDown)
        self.view.addSubview(button)
        
        //self.view.addSubview(viewSolu)
        Terminal.generateTerminal()
        var num = Int(arc4random_uniform(UInt32(Terminal.Arraysforterminal.count)))
        var selectT = Terminal.Arraysforterminal[num]
        switch NewGame.gameLevel {
        case "Easy":
            NewGame.gameArray = algorithm.EasySequence(selectT, (36, 60) , 4)
            break
        case "Medium":
            NewGame.gameArray = algorithm.MediumSequence(selectT, (32, 35), 3)
            break
        case "Difficult":
            NewGame.gameArray = algorithm.DifficultSequence(selectT, (28, 31), 2)
            break
        default:
            NewGame.gameArray = algorithm.EvilSequence(selectT, (22, 27), 0)
        }
        SolutionView.soluArray = selectT
        
    }
    
    func switchViewControl(){
        let nextSolutionController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "solutionViewStoryboardId")
        self.present(nextSolutionController, animated:true, completion:nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 9, height: view.frame.width / 9)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0{
            return CGSize(width: view.frame.width, height: 150)
        }
        return CGSize(width: view.frame.width, height: 0)

    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 9
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! SudokuCell
        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .yellow
        print("item: \(indexPath.item)")
        print("section: \(indexPath.section)")
       
        if NewGame.gameArray[indexPath.section][indexPath.item] != 0{
            cell.numberText.text = "\(NewGame.gameArray[indexPath.section][indexPath.item])"
            cell.numberText.isEnabled = false
        }
    
       // cell.numberText.text = "\(NewGame.gameArray[indexPath.row][indexPath.item])"
        return cell
    }

}
