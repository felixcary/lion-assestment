//
//  StoryboardSeembly.swift
//  LionAssestment
//
//  Created by Felix Cary Giovanni on 28/05/21.
//

import Foundation
import Swinject
import SwinjectStoryboard

class StoryboardsAssembly: Assembly {
    
    func assemble(container: Container) {

        container.storyboardInitCompleted(HomeViewController.self) { r, c in
            c.homeViewModel = r.resolve(HomeViewModel.self)!
        }

    }
}

