//
//  SwinjectSetup.swift
//  LionAssestment
//
//  Created by Felix Cary Giovanni on 28/05/21.
//

import Foundation
import SwinjectStoryboard
import Swinject

extension SwinjectStoryboard {
    
    @objc class func setup() {
        Container.loggingFunction = nil
        _ = Assembler([
                StoryboardsAssembly(),
                ViewModelsAssembly(),
                InteractorsAssembly(),
                StoragesAssembly(),
                ApisAssembly()
            ],
            container: defaultContainer
        )
    }
}


