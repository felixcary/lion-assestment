//
//  StorageAssembly.swift
//  LionAssestment
//
//  Created by Felix Cary Giovanni on 28/05/21.
//

import Foundation
import Swinject

class StoragesAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(SongStore.self) { r in
            SongRealmStore()
        }
        
    }
    
}

