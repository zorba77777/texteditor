//
//  ViewController.swift
//  textedit
//
//  Created by Timur Sasin on 31/08/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var executedCommands:[Command] = []
    
    @IBOutlet weak var textView: UITextView?
    
    var state: ViewControllerState!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.state = ViewControllerStateCommon(viewController: self)
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44.0))
        
        toolbar.items = [
            UIBarButtonItem(image: UIImage(named: "bold"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(toggleBold)),
            UIBarButtonItem(image: UIImage(named: "italic"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(toggleItalic)),
            UIBarButtonItem(image: UIImage(named: "hammer"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(toggleFonteSize))
        ]
        
        textView?.inputAccessoryView = toolbar
        
        self.becomeFirstResponder()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        guard event?.subtype == .motionShake else { return }
        self.undoLastCommand()
    }
    
    
    func execute(command: Command) {
        executedCommands.append(command)
        command.execute()
    }
    
    func undoLastCommand() {
        let c = self.executedCommands.popLast()
        c?.undo()
    }
    
    @objc func toggleItalic() {
        self.state.toggleItalic()
    }
    
    @objc func toggleBold() {
        self.state.toggleBold()
    }
    
    @objc func toggleFonteSize() {
        self.state.toggleFontSize()
    }
    
}

