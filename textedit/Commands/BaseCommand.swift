//
//  AbstractCommand.swift
//  textedit
//
//  Created by Timur Sasin on 01/09/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import Foundation

protocol Command {
    
    func execute()
    
    func undo()

}
