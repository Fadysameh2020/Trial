//
//  PrimaryTextFeild.swift
//  Driver
//
//  Created by Eslam Mohamed on 22/05/2024.
//

import UIKit

final class PrimaryTextFeild: NibLoadingView {

    @IBOutlet private weak var inputTextFeild: UITextField!
    @IBOutlet private weak var FeildButton: UIButton!
    @IBOutlet private weak var TextFeildLabel: PoppinsRegular!
    
    
    func configure(model: UIModel) {
        TextFeildLabel.text = model.placeHolder.value
        if model.dimmed {
            TextFeildLabel.textColor = UIColor.black.withAlphaComponent(0.4)
            inputTextFeild.isUserInteractionEnabled = false
        }
        
        if let image = model.withImage {
            FeildButton.isHidden = false
            FeildButton.setImage(image, for: [])
        }
        
        inputTextFeild.keyboardType = model.keyboardType
    }
    
    func setTextFeildText(text: String) {
        inputTextFeild.text = text
    }
    
    func textDidChangeNotification() -> AnyPublisher <String, Never> {
        return NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: inputTextFeild)
            .map { ($0.object as? UITextField)?.text  ?? "" }
            .eraseToAnyPublisher()
    }
    
    func textDidBeginEditingNotification() -> AnyPublisher <String, Never> {
        return NotificationCenter.default
            .publisher(for: UITextField.textDidBeginEditingNotification, object: inputTextFeild)
            .map { ($0.object as? UITextField)?.text  ?? "" }
            .eraseToAnyPublisher()
    }
    
    func setInputViewtextFeild(datePicker: UIDatePicker) {
        inputTextFeild.inputView = datePicker
    }

}

extension PrimaryTextFeild {
    struct UIModel {
        let dimmed: Bool
        let placeHolder: AppLocalizedKeys
        let withImage: UIImage?
        let keyboardType: UIKeyboardType
        
        init(dimmed: Bool = false, placeHolder: AppLocalizedKeys, withImage: UIImage? = nil, keyboardType: UIKeyboardType = .default) {
            self.dimmed = dimmed
            self.placeHolder = placeHolder
            self.withImage = withImage
            self.keyboardType = keyboardType
        }
    }

}
