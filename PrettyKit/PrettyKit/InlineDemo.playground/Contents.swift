//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
import PrettyKit

private enum Section {
    case Grouped(rows: Int)
    case GroupedDetached(rows: Int)
    case None(rows: Int)
    
    var rows: Int {
        switch self {
        case .Grouped(let rows):
            return rows
        case .GroupedDetached(let rows):
            return rows
        case .None(let rows):
            return rows
        }
    }
}

public class DemoViewController: UIViewController {
    
    private var sections: [Section] = []
    
    private lazy var collectionView: UICollectionView = {
        let inlineLayout = InlineLayout()
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: inlineLayout)
        collectionView.backgroundColor = UIColor.lightGrayColor()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerClass(InlineTestCell.self, forCellWithReuseIdentifier: "Test")
        
        
        return collectionView
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
//        sections = [
//            .Grouped(rows: 4),
//            .GroupedDetached(rows: 3),
//            .None(rows: 3),
//            .Grouped(rows: 3),
//            .Grouped(rows: 5),
//        ]
        
        view.addSubview(collectionView)
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[collectionView]-0-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["collectionView": collectionView]))
        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[collectionView]-0-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["collectionView": collectionView]))
        
        view.frame = CGRect(x: 0, y: 0, width: 414, height: 576)
        
    }
}

extension DemoViewController: UICollectionViewDataSource {
    
    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        return collectionView.dequeueReusableCellWithReuseIdentifier("Test", forIndexPath: indexPath)
    }
    
    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].rows
    }
    
    public func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return sections.count
    }
}

extension DemoViewController: UICollectionViewDelegate {
    public func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("Selected")
    }
}


extension DemoViewController: InlineLayoutDelegate {
    public func inlineLayout(inlineLayout: InlineLayout, heightForItemAtIndexPath indexPath: NSIndexPath, forWidth: CGFloat) -> CGFloat {
        
        return 44
    }
    
    public func inlineLayout(inlineLayout: InlineLayout, marginsForItemAtIndexPath indexPath: NSIndexPath) -> InlineLayoutMargins {
        
        guard let layout = collectionView.collectionViewLayout as? InlineLayout else {
            return InlineLayoutMarginsZero
        }
        
        return layout.defaultItemMargins
    }
    
    public func inlineLayout(inlineLayout: InlineLayout, marginsForSection section: Int) -> InlineLayoutMargins {
        guard let layout = collectionView.collectionViewLayout as? InlineLayout else {
            return InlineLayoutMarginsZero
        }
        
        return layout.defaultSectionMargins
    }
    
    public func inlineLayout(inlineLayout: InlineLayout, styleForItemAtIndexPath indexPath: NSIndexPath) -> InlineCellStyle {
        
        switch (sections[indexPath.section], indexPath.item) {
        case (Section.Grouped(_), _):
            return .Grouped
        case (Section.GroupedDetached(_), 0):
            return .Detached
        case (Section.GroupedDetached(_), _):
            return .Grouped
        case (Section.None(_), _):
            return .Grouped
        }
        
    }
}

extension DemoViewController {
    private func removeSection(section: Int) {
        sections.removeAtIndex(section)
        collectionView.deleteSections(NSIndexSet(index: section))
    }
    
    private func addSection(section: Section, index: Int = 0) {
        sections.insert(section, atIndex: 0)
        collectionView.insertSections(NSIndexSet(index: index))
    }
}

let vc = DemoViewController()
XCPlaygroundPage.currentPage.liveView = vc.view

func delay(seconds: Double, action: () -> Void) {
    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
    dispatch_after(delayTime, dispatch_get_main_queue()) {
        action()
    }
}
//
//delay(2) {
//    [unowned vc] in
//    vc.removeSection(2)
//}
//
//delay(5) {
//    [unowned vc] in
//    vc.addSection(.Grouped(rows: 4))
//}
//
//delay(10) {
//    [unowned vc] in
//    vc.addSection(.None(rows: 4), index: 1)
//}


