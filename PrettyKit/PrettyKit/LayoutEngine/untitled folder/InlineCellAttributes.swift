
import UIKit

/**
 *  Custom attributes for Inline-styled collection view items.
 */
final class InlineCellAttributes: UICollectionViewLayoutAttributes {
    // MARK: - Internal Properties
    
    /// Indicates how the cell at this index path should be displayed.
    var style = InlineCellStyle.Grouped
    
    /// Indicates where this cell appears in a group of cells.
    var position = InlineCellPosition.Solo
}

// MARK: - UICollectionViewLayoutAttributes

extension InlineCellAttributes {
    override func isEqual(object: AnyObject?) -> Bool {
        if let object = object as? InlineCellAttributes {
            return self.style == object.style &&
                self.position == object.position &&
                super.isEqual(object)
        } else {
            return false
        }
    }
}

// MARK: - NSCopying

extension InlineCellAttributes {
    override func copyWithZone(zone: NSZone) -> AnyObject {
        let cell = super.copyWithZone(zone) as! InlineCellAttributes
        cell.style = self.style
        cell.position = self.position
        
        return cell
    }
}
