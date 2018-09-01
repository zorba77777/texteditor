//
//  ViewControllerStatePremium.swift
//  textedit
//
//  Created by Timur Sasin on 01/09/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerStatePremium: ViewControllerState {
    
    weak var viewController: ViewController?
    
    init(viewController: ViewController?) {
        self.viewController = viewController
    }
    
    @objc func toggleItalic() {
        guard let viewController = viewController else { return }
        viewController.execute(command: TraitsToggleCommand(receiver: viewController.textView, traits: .traitItalic))
    }
    
    @objc func toggleBold() {
        guard let viewController = viewController else { return }
        viewController.execute(command: TraitsToggleCommand(receiver: viewController.textView, traits: .traitBold))
    }
    
    @objc func toggleFontSize() {
        guard let viewController = viewController else { return }
        viewController.execute(command: FontSizeToggleCommand(receiver: viewController.textView))
    }
    
    func handleShake() {
        guard let viewController = viewController else { return }
        viewController.undoLastCommand()
    }
    
    
}
