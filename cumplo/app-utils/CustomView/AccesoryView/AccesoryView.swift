//
//  AccesoryView.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 5/17/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import UIKit

class AccesoryView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mountTextField: UITextField!
    @IBOutlet weak var simulateButton: UIButton!
    @IBOutlet weak var inversionButton: UIButton!
    @IBOutlet weak var ecommerceButton: UIButton!
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    fileprivate func setup() {
        let view: UIView! = nib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    fileprivate func nib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}
