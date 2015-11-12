
public enum InlineLayoutMarginStyle {
    case None
    case Narrow
    case Wide
}

public struct InlineLayoutMargins {
    var top: InlineLayoutMarginStyle
    var right: InlineLayoutMarginStyle
    var bottom: InlineLayoutMarginStyle
    var left: InlineLayoutMarginStyle
}

public let InlineLayoutMarginsZero = InlineLayoutMargins(top: .None, right: .None, bottom: .None, left: .None)