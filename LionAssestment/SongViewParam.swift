//
//  SongViewParam.swift
//  LionAssestment
//
//  Created by Felix Cary Giovanni on 28/05/21.
//

import Foundation

class SongListViewParam {
    
    var id = 0
    var title = ""
    var preview = ""
    var artistId = ""
    var artistName = ""
    var artistPicture = ""
    var albumTitle = ""
    var albumCover = ""
    
    static func create(song: Song) -> SongListViewParam {
        let songListViewParam = SongListViewParam()
        songListViewParam.id = song.id
        songListViewParam.id = song.id
        songListViewParam.title = song.title
        songListViewParam.preview = song.preview
        songListViewParam.artistId = song.artistId
        songListViewParam.artistName = song.artistName
        songListViewParam.artistPicture = song.artistPicture
        songListViewParam.albumTitle = song.albumTitle
        songListViewParam.albumCover = song.albumCover
        
        return songListViewParam
    }
    
    static func create(songList: [Song]) -> [SongListViewParam] {
        var songListViewParams = [SongListViewParam]()
        songList.forEach { (song) in
            songListViewParams.append(SongListViewParam.create(song: song))
        }
        return songListViewParams
    }
}
