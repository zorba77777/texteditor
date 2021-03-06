//
//  BaseViewControllerState.swift
//  textedit
//
//  Created by Timur Sasin on 01/09/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import Foundation

protocol ViewControllerState {
    
    func toggleItalic()
    
    func toggleBold()
    
    func toggleFontSize()
    
    func handleShake()
}
