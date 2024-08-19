//
//  Inter400.swift
//  StationaryClient
//
//  Created by Eslam Mohamed on 18/02/2024.
//

import Foundation
import UIKit

@IBDesignable
class PoppinsRegular: UILabel {
    
    @IBInspectable var fontSize: CGFloat = 12 {
        didSet {
            updateView()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        updateView()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateView()
        
    }
    private func updateView() {
        self.font = R.font.poppinsRegular.callAsFunction(size: fontSize)
    }
    
}
