//
//  AddSubtractButtonView.swift
//  Viva1
//
//  Created by vishwender on 8/21/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation
import UIKit

protocol AddSubtractButtonViewDelegate: class {
    func subtractButtonTapped()
    func addButtonTapped()
}

class AddSubtractButtonView: UIView {
    
    struct Constants {
        static let nibName = "AddSubtractButtonView"
    }
    weak var viewDelegate: AddSubtractButtonViewDelegate?
    
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var quantityNumberLabel: UILabel!
    
    @IBAction func subtractButtonTapped(_ sender: Any) {
        viewDelegate?.subtractButtonTapped()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        viewDelegate?.addButtonTapped()
    }
    
    
    class func getView(frame: CGRect) -> AddSubtractButtonView {
        var addSubtractView: AddSubtractButtonView?
        if let view = Bundle.main.loadNibNamed(Constants.nibName, owner: nil, options: nil)?.first as? AddSubtractButtonView {
            addSubtractView = view
            addSubtractView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            addSubtractView?.frame = frame
        }
        return addSubtractView!
    }
}
