//
//  SongResponse.swift
//  LionAssestment
//
//  Created by Felix Cary Giovanni on 28/05/21.
//

import Foundation
import ObjectMapper

class SongListDataReponse: Mappable {
    var data = [SongListReponse]()
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        data <- map["data"]
    }
    
    func toSongList() -> [Song] {
        var songList = [Song]()
        data.forEach { songListReponse in
            songList.append(songListReponse.toSong())
        }
        return songList
    }
}

class SongListReponse: Mappable {
    var id = 0
    var title = ""
    var preview = ""
    var artistId = ""
    var artistName = ""
    var artistPicture = ""
    var albumTitle = ""
    var albumCover = ""
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        preview <- map["preview"]
        artistId <- map["artist.artistId"]
        artistName <- map["artist.artistName"]
        artistPicture <- map["artist.artistPicture"]
        albumTitle <- map["album.albumTitle"]
        albumCover <- map["album.albumCover"]
    }
    
    func toSong() -> Song {
        let song = Song()
        song.id = id
        song.title = title
        song.preview = preview
        song.artistId = artistId
        song.artistName = artistName
        song.artistPicture = artistPicture
        song.albumTitle = albumTitle
        song.albumCover = albumCover
        
        return song
    }
}

