//
//  SolutionView.swift
//  SocialSudoku
//
//  Created by Katrina Jiao on 09/08/2017.
//  Copyright © 2017 Katrina Jiao. All rights reserved.
//

import Foundation
import UIKit
class SolutionView : UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    static var soluArray = [[Int]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let headerLabel = UILabel()
        headerLabel.frame = CGRect(x: 150, y: 50, width: 200, height:50)
        headerLabel.text = "Game Solution"
        headerLabel.font = UIFont.boldSystemFont(ofSize: 28)
        self.view.addSubview(headerLabel)
        
        
        
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId2", for: indexPath) as! SudokuCell
        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .yellow
        cell.numberText.isEnabled = false
        if SolutionView.soluArray[indexPath.section][indexPath.item] != 0{
            cell.numberText.text = "\(SolutionView.soluArray[indexPath.section][indexPath.item])"
        }
    
        return cell
    }
    
}
