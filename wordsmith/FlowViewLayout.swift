//
//  FlowViewLayout.swift
//  wordsmith
//
//  Created by SHIH, FREDERIC on 12/18/17.
//  Copyright © 2017 District196. All rights reserved.


import UIKit
protocol FlowLayoutDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView:UICollectionView, heightForCardAtIndexPath indexPath:IndexPath) -> CGFloat
}
class FlowVeiwLayout: UICollectionViewLayout{
    
    
    weak var delegate: FlowLayoutDelegate!
    
    
    // var
    var numberOfColumns = 0
    var cellPadding: CGFloat = 8
    var contentHeight: CGFloat = 0
    var screenWidth = UIScreen.main.bounds.size.width
    var screenHeight = UIScreen.main.bounds.size.height
    
    // fuck if I know what this is
    var cache = [UICollectionViewLayoutAttributes]()
    
    fileprivate var contentWidth: CGFloat {
        guard let collectionView = collectionView
            else {
        return 0
        }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    
    
   //dictates collection view scroll area
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    
    //dictates amount of items in a column
    func columnIndexForItemAt(indexPath: IndexPath) -> Int {
        return indexPath.item % numberOfColumns
        
    }
    
    func calculateItemFrame(indexPath: IndexPath, columnIndex: Int, columnYoffset: CGFloat) -> CGRect {
        return CGRect.zero
    }
    
    //blank for now
    func calculateItemsSize() {
        
    }

    

   
    override func prepare(){
        guard cache.isEmpty == true, let collectionView = collectionView else {
            return
        }
        //variable manipulation prework
        cache.removeAll()
       
        //items casting and variable instantiations
        let items = collectionView.numberOfItems(inSection: 0)
        let itemdouble = Double(items)
        let itemsCGFloat = CGFloat(itemdouble)
        
        
        //set y and x offset to zero
        var yOffset = [CGFloat](repeating: 0, count: items)
        var xOffset = [CGFloat](repeating: 0, count: items)
        
        
        let CellHeight = screenHeight / (itemsCGFloat / CGFloat(numberOfColumns))
        let CellWidth = CellHeight + CellHeight * 0.3
        
     
            // actualy proccess by which we auto size card layout
            for item in 0 ..< collectionView.numberOfItems(inSection: 0)
            {
                let indexPath = IndexPath(item: items, section: 0)
                
                //item casting
                let itemdouble = Double(item)
                let itemCGFloat = CGFloat(itemdouble)
                
                
                if item == 1 {
                yOffset[items] = cellPadding
                xOffset[items] = cellPadding
                }
                
                //calculate the corrdinates here
                else
                {
                    let temp = collectionView.cellForItem(at: indexPath) as! CardView
                    if temp.isItEndOfSpeech() == true
                    {
                        yOffset[items] = cellPadding
                        xOffset[items] = cellPadding * itemCGFloat + itemCGFloat * CellWidth
                    }
                    else
                    
                }
                
                
                //Check if it's a different speech
                
                let temp = collectionView.cellForItem(at: indexPath) as! CardView
                if temp.isItEndOfSpeech() == true
                {
                    
                }
                
                
                let frame = CGRect(x: xOffset[items], y: yOffset[item], width: CellHeight, height: CellWidth)
                let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
                
                
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = insetFrame
                cache.append(attributes)
                
                

        }
        
    }
    
    
    //this is depreciated RIP old parthner
    /*override func prepare()
        
        //variable instantiations
        let columnWidth = ( screenWidth / CGFloat(numberOfColumns) )
        var xOffset = [CGFloat]()
        
        for counter in 0 ..< numberOfColumns
        {
            xOffset.append(CGFloat(counter) * columnWidth)
        }
        var column = 0
        
        var yOffset = [CGFloat](repeating: 0, count: numberOfColumns)
        
        // actualy proccess by which we auto size card layout
        for item in 0 ..< collectionView.numberOfItems(inSection: 0) {
            
            let indexPath = IndexPath(item: item, section: 0)
            
            
            let CardHeight = screenHeight / (itemCGFloat / CGFloat(numberOfColumns))
            let height = cellPadding * 2 + CardHeight
            
            
            
            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: columnWidth)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            
            
            contentHeight = max(contentHeight, frame.maxY)
            yOffset[column] = yOffset[column] + height
            column = column < (numberOfColumns - 1) ? (column + 1) : 0
            
            //check if card is end of speech
            let temp = collectionView.cellForItem(at: indexPath) as! CardView
            if temp.isItEndOfSpeech() == true
            {
                
            }
        }
    }*/
    
    
    
    
    
    
    
    
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        // Loop through the cache and look for items in the rect
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }
    
    
    //returns layout attribute for a specific item
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
}
