//
//  CollectionViewCell.swift
//  wordsmith
//
//  Created by SHIH, FREDERIC on 12/7/17.
//  Copyright © 2017 District196. All rights reserved.
//

import UIKit

class CardView: UICollectionViewCell {
    //copy of card holder test class
    let storedCard:Card?
    
    //TODO Way to store location of a Card initialized elsewhere
    
    //generic initializer.
    /*init() {
        super.init()
        storedCard = nil
    }
    */
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func showcard(){
    //main methods to be used for showing card in the flow veiw
    }
}
