import UIKit


public class InlineTestCell: InlineCellBase {

    // MARK: - Internal Functions

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    // MARK: - Private Functions

    var label: UILabel = UILabel(frame: CGRect(x: 5, y: 5, width: 200, height: 50))
    
    private func setup() {
        label.text = "Inline"
        contentView.addSubview(label)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        label.center.y = contentView.center.y
    }
}