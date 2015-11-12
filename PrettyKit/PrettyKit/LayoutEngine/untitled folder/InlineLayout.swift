
import UIKit

/**
 *  Inline-styled collection view layout. Designed to handle all of the cell styles defined for the
 *  Target app.
 */
public class InlineLayout: UICollectionViewLayout {
    // MARK: - Internal Properties
    
    /// Indicates whether or not to collapse the first section's top margin. Default is true.
    public var collapseFirstSectionTopMargin = true
    
    /// Indicates whether or not to collapse the last section's bottom margin. Default is true.
    public var collapseLastSectionBottomMargin = true
    
    /// Margins that surround the entire collection view.
    public var collectionViewMargins = InlineLayoutMargins(top: .Narrow, right: .None, bottom: .Narrow, left: .None)
    
    /// Default section margins.
    public var defaultSectionMargins = InlineLayoutMargins(top: .None, right: .None, bottom: .Wide, left: .None)
    
    /// Default item margins.
    public var defaultItemMargins = InlineLayoutMargins(top: .None, right: .Narrow, bottom: .None, left: .Narrow)
    
    /// Default item height.
    public var defaultItemHeight = CGFloat(44.0)
    
    // MARK: - Private Properties
    
    private var cachedContentSize = CGSizeZero
    private var currentAttributes = [NSIndexPath: InlineCellAttributes]()
}

// MARK: - UICollectionViewLayout

public extension InlineLayout {
    override func prepareLayout() {
        super.prepareLayout()

        currentAttributes.removeAll(keepCapacity: true)
        
        let inlineLayoutDelegate = collectionView?.delegate as? InlineLayoutDelegate

        let contentSizeWidth = collectionView?.bounds.size.width ?? 0.0
        var y = points(forLayoutMarginStyle: collectionViewMargins.top)
        
        if let sectionCount = self.collectionView?.numberOfSections() {
            for sectionIndex in 0..<sectionCount {
                let sectionMargins = inlineLayoutDelegate?.inlineLayout(self, marginsForSection: sectionIndex) ?? defaultSectionMargins
                
                let isFirstSection = sectionIndex == 0
                
                if !isFirstSection || !collapseFirstSectionTopMargin {
                    let topMargin = points(forLayoutMarginStyle: sectionMargins.top)
                    y += topMargin
                }
                
                if let itemCount = collectionView?.numberOfItemsInSection(sectionIndex) {
                    for itemIndex in 0..<itemCount {
                        let indexPath = NSIndexPath(forItem: itemIndex, inSection: sectionIndex)
                        let itemMargins = inlineLayoutDelegate?.inlineLayout(self, marginsForItemAtIndexPath: indexPath) ?? defaultItemMargins
                        
                        
                        // width
                        var w = contentSizeWidth
                        w -= points(forLayoutMarginStyle: itemMargins.left)
                        w -= points(forLayoutMarginStyle: itemMargins.right)
                        w -= points(forLayoutMarginStyle: sectionMargins.left)
                        w -= points(forLayoutMarginStyle: sectionMargins.right)
                        
                        // height
                        let h = inlineLayoutDelegate?.inlineLayout(self, heightForItemAtIndexPath: indexPath, forWidth:contentSizeWidth) ?? defaultItemHeight
                        
                        // x
                        var x = points(forLayoutMarginStyle: itemMargins.left)
                        x += points(forLayoutMarginStyle: sectionMargins.left)
                        
                        // y
                        let isFirstItem = itemIndex == 0
                        let isLastItem = itemIndex == itemCount - 1
                        var previousItemStyle: InlineCellStyle? = nil
                        var nextItemStyle: InlineCellStyle? = nil
                        
                        if !isFirstItem {
                            let previousIndexPath = NSIndexPath(forItem: itemIndex - 1, inSection: sectionIndex)
                            previousItemStyle = inlineLayoutDelegate?.inlineLayout(self, styleForItemAtIndexPath: previousIndexPath)
                        }
                        
                        if !isLastItem {
                            let nextIndexPath = NSIndexPath(forItem: itemIndex + 1, inSection: sectionIndex)
                            nextItemStyle = inlineLayoutDelegate?.inlineLayout(self, styleForItemAtIndexPath: nextIndexPath)
                        }
                        
                        let isMiddleItem = !isFirstItem && !isLastItem
                        let style = inlineLayoutDelegate?.inlineLayout(self, styleForItemAtIndexPath: indexPath)
                        let isDetached = style == .Detached
                        let previousItemIsDetached = previousItemStyle == .Detached
                        let nextItemIsDetached = nextItemStyle == .Detached
                        
                        if (!isFirstItem && isDetached) || (!isDetached && previousItemIsDetached) {
                            // Add top margin for detached items.
                            y += points(forLayoutMarginStyle: .Narrow)
                        }
                        
                        let attributes = InlineCellAttributes(forCellWithIndexPath: indexPath)
                        attributes.frame = CGRectMake(x, y, w, h)
                        attributes.style = style ?? .Grouped
                        
                        let isSoloItem = itemCount == 1 || isDetached ||
                            (isFirstItem && nextItemIsDetached) ||
                            (isLastItem && previousItemIsDetached) ||
                            (isMiddleItem && previousItemIsDetached && nextItemIsDetached)
                        
                        if isSoloItem  {
                            attributes.position = .Solo
                        } else if isFirstItem || (isMiddleItem && previousItemIsDetached) {
                            attributes.position = .Top
                        } else if isLastItem || (isMiddleItem && nextItemIsDetached) {
                            attributes.position = .Bottom
                        } else {
                            attributes.position = .Middle
                        }
                        
                        currentAttributes[indexPath] = attributes
                        
                        // Advance the current y position by the height of this item.
                        y += h
                    }
                    
                    let isLastSection = sectionIndex == sectionCount - 1
                    
                    // Only execute this if at least one item was in the section. Otherwise, it shouldn't
                    // "count" against the next margin.
                    if itemCount > 0 && (!isLastSection || !collapseLastSectionBottomMargin) {
                        let bottomMargin = points(forLayoutMarginStyle: sectionMargins.bottom)
                        y += bottomMargin
                    }
                }
            }
        }
        
        y += points(forLayoutMarginStyle: collectionViewMargins.bottom)
        cachedContentSize = CGSize(width: contentSizeWidth, height: y)
    }
    
    override func collectionViewContentSize() -> CGSize {
        return cachedContentSize
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var intersection = [InlineCellAttributes]()
        
        for attributes in currentAttributes.values {
            if CGRectIntersectsRect(rect, attributes.frame) {
                intersection.append(attributes)
            }
        }
        
        return intersection
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        return currentAttributes[indexPath]
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        let oldBounds = collectionView?.bounds ?? CGRectZero
        let sizeChanged = !CGSizeEqualToSize(oldBounds.size, newBounds.size)
        
        return sizeChanged
    }
    
    // MARK: - Private Functions
    
    private func points(forLayoutMarginStyle style: InlineLayoutMarginStyle) -> CGFloat {
        switch style {
        case .None:
            return 0.0
            
        case .Narrow:
            return 5.0
            
        case .Wide:
            return 20.0
        }
    }
}
