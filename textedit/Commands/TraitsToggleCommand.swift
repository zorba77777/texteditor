//
//  Commands.swift
//  textedit
//
//  Created by Timur Sasin on 31/08/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import Foundation
import UIKit

class TraitsToggleCommand: Command {
    
    weak var textView: UITextView?
    
    let traits: UIFontDescriptorSymbolicTraits
    
    init(receiver: UITextView?, traits: UIFontDescriptorSymbolicTraits) {
        textView = receiver
        self.traits = traits
    }
    
    func execute() {
        guard let textView = textView else {
            return
        }
        textView.font = textView.font?.copyWithToggled(traits: traits)
    }
    
    func undo() {
        execute()
    }
    
}
