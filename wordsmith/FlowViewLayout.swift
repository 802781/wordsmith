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
    
    // placeholder values
    //public var position = CardView[1][1]() dunno if we need this yet

    var numberOfColumns = 8
    var cellPadding: CGFloat = 6
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
    
    
    // shows how large the cellection veiw ts
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    
    func setup() {
    }
    
    
    //prepare
    override func prepare() {
        // 1
        guard cache.isEmpty == true, let collectionView = collectionView else {
            return
        }
        // variable casting for numer of items
        let items = collectionView.numberOfItems(inSection: 0)
        let itemdouble = Double(items)
        let itemCGFloat = CGFloat(itemdouble)
        
        
        //variable instantiations
        let columnWidth = ( screenWidth / CGFloat(numberOfColumns) ) - cellPadding
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
            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
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
    }
    
    
    
    
    
    
    
    
    
    
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
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
}
