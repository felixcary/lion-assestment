//
//  Song.swift
//  LionAssestment
//
//  Created by Felix Cary Giovanni on 28/05/21.
//

import Foundation
import RealmSwift

class Song: Object {
    @objc dynamic var id = 0
    @objc dynamic var title = ""
    @objc dynamic var preview = ""
    @objc dynamic var artistId = ""
    @objc dynamic var artistName = ""
    @objc dynamic var artistPicture = ""
    @objc dynamic var albumTitle = ""
    @objc dynamic var albumCover = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

