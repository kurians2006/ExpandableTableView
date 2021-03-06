//
//  ExpandableTableViewCell.swift
//  ExpandableTableView
//
//  Created by Vesza Jozsef on 06/05/15.
//  Copyright (c) 2015 Vesza Jozsef. All rights reserved.
//

import UIKit

typealias ActionHandler = (UIButton, NSIndexPath) -> Void

let detailViewDefaultHeight: CGFloat = 44
let lowLayoutPriority: Float = 250
let highLayoutPriority: Float = 999

class ExpandableTableViewCell: UITableViewCell {

    @IBOutlet private weak var mainTitleLabel: UILabel!
    @IBOutlet private weak var detailViewHeightConstraint: NSLayoutConstraint!
    
    var showsDetails = false {
        didSet {
            detailViewHeightConstraint.priority = showsDetails ? lowLayoutPriority : highLayoutPriority
        }
    }
    
    var detailButtonActionHandler: ActionHandler = { _ in }
    var indexPath = NSIndexPath()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        detailViewHeightConstraint.constant = 0
    }
    
    var mainTitle: String! {
        didSet {
            mainTitleLabel.text = mainTitle
        }
    }
    
    @IBAction private func didPressDetailButton(sender: UIButton) {
        detailButtonActionHandler(sender, indexPath)
    }
}
