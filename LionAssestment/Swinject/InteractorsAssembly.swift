//
//  InteractorsAssembly.swift
//  LionAssestment
//
//  Created by Felix Cary Giovanni on 28/05/21.
//

import Foundation
import Swinject

class InteractorsAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(DisplaySongProtocol.self) { r in
            DisplaySong(api: r.resolve(SongApi.self)!, songStore: r.resolve(SongStore.self)!)
        }

    }
    
}

