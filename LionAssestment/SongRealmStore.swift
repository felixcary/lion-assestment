//
//  SongRealmStore.swift
//  LionAssestment
//
//  Created by Felix Cary Giovanni on 28/05/21.
//

import Foundation
import RealmSwift

class SongRealmStore: RealmStore, SongStore {
    func save(songList: [Song]) {
        try! realm.write {
            realm.add(songList, update: .all)
        }
    }
    
    func getSongList() -> [Song]? {
        return Array(realm.objects(Song.self))
    }
    
    func clear() {
        try! realm.write {
            realm.delete(realm.objects(Song.self))
        }
    }
        
}
