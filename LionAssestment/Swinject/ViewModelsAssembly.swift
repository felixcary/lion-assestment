//
//  ViewModelsAssembly.swift
//  LionAssestment
//
//  Created by Felix Cary Giovanni on 28/05/21.
//

import Foundation
import Swinject

class ViewModelsAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(HomeViewModel.self) { r in
            HomeViewModel(displaySong: r.resolve(DisplaySongProtocol.self)!)
        }
        
        container.register(SongDetailViewModel.self) { r in
            SongDetailViewModel()
        }
    }
}

