//
//  States.swift
//  textedit
//
//  Created by Timur Sasin on 31/08/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerStateCommon: ViewControllerState {
    
    weak var viewController: ViewController?
    
    init(viewController: ViewController?) {
        self.viewController = viewController
    }
    
    func toggleItalic() {
        
        let successHandler: (UIAlertAction) -> Void = { _ in
            self.setPremiumViewControllerState()
            self.viewController?.state.toggleItalic()
        }
        
        showPayAlert(handler: successHandler)
    }
    
    func toggleBold() {
        
        let successHandler: (UIAlertAction) -> Void = { _ in
            self.setPremiumViewControllerState()
            self.viewController?.state.toggleBold()
        }
        
        showPayAlert(handler: successHandler)
    }
    
    func toggleFontSize() {
        
        let successHandler: (UIAlertAction) -> Void = { _ in
            self.setPremiumViewControllerState()
            self.viewController?.state.toggleFontSize()
        }
        
        showPayAlert(handler: successHandler)
    }
    
    func handleShake() {}
    
    func showPayAlert(handler: @escaping (UIAlertAction) -> Void) {
        
        let alert = UIAlertController(title: "For premium users only", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Get premium access ($5)", style: .default, handler: handler))
        viewController?.present(alert, animated: true, completion: nil)
    }
    
    func setPremiumViewControllerState() {
        
        guard let viewController = self.viewController else { return }
        viewController.state = ViewControllerStatePremium(viewController: viewController)
    }
}
