//
//  ApiAssembly.swift
//  LionAssestment
//
//  Created by Felix Cary Giovanni on 28/05/21.
//

import Foundation
import Swinject

class ApisAssembly: Assembly {
    func assemble(container: Container) {
        
        container.register(ApiServiceProtocol.self) { r in
            ApiService()
        }
        
        container.register(SongApi.self) { r in
            SongApiService(apiClient: r.resolve(ApiServiceProtocol.self)!)
        }
        
    }
}
