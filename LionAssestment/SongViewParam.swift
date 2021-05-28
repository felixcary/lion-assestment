//
//  SongViewParam.swift
//  LionAssestment
//
//  Created by Felix Cary Giovanni on 28/05/21.
//

import Foundation

class SongViewParam {
    
    var id = 0
    var title = ""
    var preview = ""
    var artistId = ""
    var artistName = ""
    var artistPicture = ""
    var albumTitle = ""
    var albumCover = ""
    
    static func create(song: Song) -> SongViewParam {
        let songViewParam = SongViewParam()
        songViewParam.id = song.id
        songViewParam.id = song.id
        songViewParam.title = song.title
        songViewParam.preview = song.preview
        songViewParam.artistId = song.artistId
        songViewParam.artistName = song.artistName
        songViewParam.artistPicture = song.artistPicture
        songViewParam.albumTitle = song.albumTitle
        songViewParam.albumCover = song.albumCover
        
        return songViewParam
    }
    
    static func create(songList: [Song]) -> [SongViewParam] {
        var songViewParams = [SongViewParam]()
        songList.forEach { song in
            songViewParams.append(SongViewParam.create(song: song))
        }
        return songViewParams
    }
}
