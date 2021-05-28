//
//  SongStore.swift
//  LionAssestment
//
//  Created by Felix Cary Giovanni on 28/05/21.
//

import Foundation

protocol SongStore {
    func save(songList: [Song])
    func getSongList() -> [Song]?
    func clear()
}
