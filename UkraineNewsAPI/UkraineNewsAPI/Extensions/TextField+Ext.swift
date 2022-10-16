//
//  TextField+Ext.swift
//  UkraineNewsAPI
//
//  Created by Эдип on 16.10.2022.
//

import SwiftUI

public extension UITextField {
    
    override var textInputMode: UITextInputMode? {
        let locale = Locale(identifier: "uk-UA")
        return UITextInputMode.activeInputModes.first(where: { $0.primaryLanguage == locale.identifier }) ?? super.textInputMode
    }
}
