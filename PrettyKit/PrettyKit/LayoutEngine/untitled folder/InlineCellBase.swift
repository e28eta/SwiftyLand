
import UIKit

/**
 *  Inline styled cell for use in InlineLayout collection views. The cell supports multiple styles
 *  as defined in the designs.
 */
public class InlineCellBase: UICollectionViewCell {
    // MARK: - Private Class Properties
    
    private static func image(named imageName: String) -> UIImage? {
        let bundle = NSBundle(forClass: InlineCellBase.self)

        return UIImage(named: imageName, inBundle: bundle, compatibleWithTraitCollection: nil)
    }
    
    private static var backgroundImageSolo: UIImage? = {
        let image = InlineCellBase.image(named: "InlineCellBackgroundSolo")
        let capInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        return image?.resizableImageWithCapInsets(capInsets)
    }()
    
    private static var backgroundImageTop: UIImage? = {
        let image = InlineCellBase.image(named: "InlineCellBackgroundTop")
        let capInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 1.0, right: 5.0)
        return image?.resizableImageWithCapInsets(capInsets)
    }()
    
    private static var backgroundImageMiddle: UIImage? = {
        let image = InlineCellBase.image(named: "InlineCellBackgroundMiddle")
        let capInsets = UIEdgeInsets(top: 0.0, left: 1.0, bottom: 1.0, right: 1.0)
        return image?.resizableImageWithCapInsets(capInsets)
    }()
    
    private static var backgroundImageBottom: UIImage? = {
        let image = InlineCellBase.image(named: "InlineCellBackgroundBottom")
        let capInsets = UIEdgeInsets(top: 0.0, left: 5.0, bottom: 5.0, right: 5.0)
        return image?.resizableImageWithCapInsets(capInsets)
    }()
    
    private static var backgroundImageHorizontalRule: UIImage? = {
        let image = InlineCellBase.image(named: "InlineCellBackgroundHorizontalRule")
        let capInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 1.0, right: 0.0)
        return image?.resizableImageWithCapInsets(capInsets)
    }()
    
    private static var highlightedBackgroundImageSolo: UIImage? = {
        let image = InlineCellBase.image(named: "InlineCellHighlightedBackgroundSolo")
        let capInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        return image?.resizableImageWithCapInsets(capInsets)
    }()
    
    private static var highlightedBackgroundImageTop: UIImage? = {
        let image = InlineCellBase.image(named: "InlineCellHighlightedBackgroundTop")
        let capInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 1.0, right: 5.0)
        return image?.resizableImageWithCapInsets(capInsets)
    }()
    
    private static var highlightedBackgroundImageMiddle: UIImage? = {
        let image = InlineCellBase.image(named: "InlineCellHighlightedBackgroundMiddle")
        let capInsets = UIEdgeInsets(top: 0.0, left: 1.0, bottom: 1.0, right: 1.0)
        return image?.resizableImageWithCapInsets(capInsets)
    }()
    
    private static var highlightedBackgroundImageBottom: UIImage? = {
        let image = InlineCellBase.image(named: "InlineCellHighlightedBackgroundBottom")
        let capInsets = UIEdgeInsets(top: 0.0, left: 5.0, bottom: 5.0, right: 5.0)
        return image?.resizableImageWithCapInsets(capInsets)
    }()
    
    private static var highlightedBackgroundImageHorizontalRule: UIImage? = {
        let image = InlineCellBase.image(named: "InlineCellHighlightedBackgroundHorizontalRule")
        let capInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 1.0, right: 0.0)
        return image?.resizableImageWithCapInsets(capInsets)
    }()
    
    // MARK: - Private Properties
    
    private var backgroundImageView: UIImageView?
    private var highlightedBackgroundImageView: UIImageView?
    
    // MARK: - Internal Functions
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup(frame: frame)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(frame: frame)
    }
    
    // MARK: - Private Functions
    
    private func setup(frame frame: CGRect) {
        backgroundView = UIView(frame: frame)
        backgroundView?.backgroundColor = .clearColor()

        backgroundImageView = UIImageView(image: InlineCellBase.backgroundImageSolo)
        backgroundImageView?.backgroundColor = .clearColor()
        backgroundView?.addSubview(backgroundImageView!)
        
        highlightedBackgroundImageView = UIImageView(image: InlineCellBase.highlightedBackgroundImageSolo)
        highlightedBackgroundImageView?.backgroundColor = .clearColor()
        highlightedBackgroundImageView?.hidden = true
        backgroundView?.addSubview(highlightedBackgroundImageView!)
    }
}

// MARK: - UICollectionViewCell

public extension InlineCellBase {
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        super.applyLayoutAttributes(layoutAttributes)
        
        if let attributes = layoutAttributes as? InlineCellAttributes {
            switch attributes.style {
            case .None:
                backgroundColor = .clearColor()
                backgroundImageView?.hidden = true
                
            case .Grouped:
                backgroundColor = .clearColor()
                backgroundImageView?.hidden = false
                
                switch attributes.position {
                case .Solo:
                    backgroundImageView?.image = InlineCellBase.backgroundImageSolo
                    highlightedBackgroundImageView?.image = InlineCellBase.highlightedBackgroundImageSolo
                    
                case .Top:
                    backgroundImageView?.image = InlineCellBase.backgroundImageTop
                    highlightedBackgroundImageView?.image = InlineCellBase.highlightedBackgroundImageTop
                    
                case .Middle:
                    backgroundImageView?.image = InlineCellBase.backgroundImageMiddle
                    highlightedBackgroundImageView?.image = InlineCellBase.highlightedBackgroundImageMiddle
                    
                case .Bottom:
                    backgroundImageView?.image = InlineCellBase.backgroundImageBottom
                    highlightedBackgroundImageView?.image = InlineCellBase.highlightedBackgroundImageBottom
                }
                
            case .Detached:
                backgroundColor = .clearColor()
                backgroundImageView?.hidden = false
                backgroundImageView?.image = InlineCellBase.backgroundImageSolo
                highlightedBackgroundImageView?.image = InlineCellBase.highlightedBackgroundImageSolo
                
            case .HorizontalRule:
                backgroundColor = .clearColor()
                backgroundImageView?.hidden = false
                backgroundImageView?.image = InlineCellBase.backgroundImageHorizontalRule
                highlightedBackgroundImageView?.image = InlineCellBase.highlightedBackgroundImageHorizontalRule
            }
        } else {
            backgroundColor = .clearColor()
            backgroundImageView?.hidden = true
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundImageView?.frame = contentView.frame
        highlightedBackgroundImageView?.frame = contentView.frame
    }
    
    override var highlighted: Bool {
        didSet {
            highlightedBackgroundImageView?.hidden = !highlighted
        }
    }
}

// MARK: - Enums

/**
The cell styles.

- None:           No border, transparent background.
- Grouped:        Rounded corners, white background, looks like a grouped table view.
- Detached:       In a grouped table view, detached from neighboring cells by a narrow margin.
- HorizontalRule: 1-point bottom border, no rounded corners, white background.
*/
public enum InlineCellStyle {
    case None
    case Grouped
    case Detached
    case HorizontalRule
}

/**
 Where this cell appears in a group. This property is set by the layout regardless of the cell's
 style. When the style is .Grouped, this determines which corners are rounded.
 
 - Solo:   Lone cell in a section.
 - Top:    Top cell in a section.
 - Middle: Somewhere not at the top or bottom.
 - Bottom: It's at the bottom.
 */
public enum InlineCellPosition {
    case Solo
    case Top
    case Middle
    case Bottom
}
