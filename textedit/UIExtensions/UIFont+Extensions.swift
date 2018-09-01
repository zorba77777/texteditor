//
//  UIFont+Extensions.swift
//  textedit
//
//  Created by Timur Sasin on 31/08/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    func copyWithToggled(traits: UIFontDescriptorSymbolicTraits) -> UIFont {
        let descriptor = self.fontDescriptor
        let currentTraits = descriptor.symbolicTraits
        let size = self.pointSize
        
        let contains = (currentTraits.rawValue & traits.rawValue) > 0
        
        let newTraits: UIFontDescriptorSymbolicTraits
        if contains {
            newTraits = UIFontDescriptorSymbolicTraits(rawValue: currentTraits.rawValue & ~traits.rawValue)
        } else {
            newTraits = UIFontDescriptorSymbolicTraits(rawValue: currentTraits.rawValue | traits.rawValue)
        }
        
        return UIFont(descriptor: (descriptor.withSymbolicTraits(newTraits))!, size: size)
    }
    
    func copyWith(size: CGFloat) -> UIFont {
        return UIFont(descriptor: self.fontDescriptor, size: size)
    }
}
