//
//  NibLoadingView.swift
//  StationaryClient
//
//  Created by Eslam Mohamed on 19/02/2024.
//
import Foundation
import UIKit

/* Usage:
 - Subclass your UIView from NibLoadView to automatically load an Xib with the same name as your class
 - Set the class name to File's Owner in the Xib file
 */

@IBDesignable
class NibLoadingView: UIView {
    
    @IBOutlet private weak var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }
    
    private func nibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        guard let nibView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Can't instantiate Nib file!")
        }
        return nibView
    }
    
}
