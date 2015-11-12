
import UIKit

/**
 *  Allows a collection view delegate to customize the attributes of sections and items.
 */
public protocol InlineLayoutDelegate: UICollectionViewDelegate {
    /**
     Asks the delegate for the height of the specified item. If this function isn't specified, then
     the layout's defaultItemHeight property is used instead.
     
     :param: InlineLayout The layout for the collection view.
     :param: indexPath     The index path of the item.
     
     :returns: The height of the specified item.
     */
    func inlineLayout(inlineLayout: InlineLayout, heightForItemAtIndexPath indexPath: NSIndexPath, forWidth: CGFloat) -> CGFloat
    
    /**
     Asks the delegate for the margins for the specified section. If this function isn't specified,
     then the layout's defaultSectionMargins are used instead.
     
     :param: InlineLayout The layout for the collection view.
     :param: section       The section.
     
     :returns: The margins for the specified section.
     */
    func inlineLayout(inlineLayout: InlineLayout, marginsForSection section: Int) -> InlineLayoutMargins
    
    /**
     Asks the delegate for the margins for the specified item. If this function isn't specified,
     then the layout's defaultItemMargins are used instead.
     
     :param: InlineLayout The layout for the collection view.
     :param: indexPath     The index path for the item.
     
     :returns: The margins for the specified item.
     */
    func inlineLayout(inlineLayout: InlineLayout, marginsForItemAtIndexPath indexPath: NSIndexPath) -> InlineLayoutMargins
    
    /**
     Asks the delegate for the style of the item at the specified index path. If this function isn't
     specified, then the .Grouped style is used instead.
     
     :param: InlineLayout The layout for the collection view.
     :param: indexPath     The index path for the item.
     
     :returns: The style for specified item.
     */
    func inlineLayout(inlineLayout: InlineLayout, styleForItemAtIndexPath indexPath: NSIndexPath) -> InlineCellStyle
}

public extension InlineLayoutDelegate {
    func inlineLayout(inlineLayout: InlineLayout, heightForItemAtIndexPath indexPath: NSIndexPath, forWidth: CGFloat) -> CGFloat {
        return 20.0
    }
}



