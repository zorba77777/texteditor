//
//  FontSizeToggleCommand.swift
//  textedit
//
//  Created by Timur Sasin on 01/09/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import Foundation
import UIKit

class FontSizeToggleCommand: Command {
    
    weak var textView: UITextView?
    
    init(receiver: UITextView?) {
        
        textView = receiver
    }
    
    func execute() {
        guard let textView = textView else { return }
        
        guard let fontCGFloatSize = textView.font?.pointSize else { return }
        let fontSize = Double(fontCGFloatSize)
        
        if fontSize == FontSizeEnum.small.rawValue {
            textView.font = textView.font?.copyWith(size: CGFloat(FontSizeEnum.large.rawValue))
        } else {
            textView.font = textView.font?.copyWith(size: CGFloat(FontSizeEnum.small.rawValue))
        }
    }
    
    func undo() {
        self.execute()
    }
    
}
