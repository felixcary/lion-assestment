//
//  DisplaySong.swift
//  LionAssestment
//
//  Created by Felix Cary Giovanni on 28/05/21.
//

import Foundation
import RxSwift
import ObjectMapper

protocol DisplaySongProtocol {
    func getAllSong() -> Single<[SongViewParam]>
}

class DisplaySong: DisplaySongProtocol {
    private let api: SongApi
    private let songStore: SongStore
    private let disposeBag = DisposeBag()
    
    init(api: SongApi, songStore: SongStore) {
        self.api = api
        self.songStore = songStore
    }
    
    func getAllSong() -> Single<[SongViewParam]> {
        if let songList = songStore.getSongList() {
            let datafromServer = getSongListFromServer()
            let dataFromCache = Single.just(SongViewParam.create(songList: songList))
            return Single.zip(dataFromCache, datafromServer, resultSelector: { cache, server in
                return server
            })
        }
        return getSongListFromServer()
    }
    
    private func getSongListFromServer() -> Single<[SongViewParam]> {
        return api.getSongList()
            .map { [weak self] songList in
                self?.songStore.clear()
                self?.songStore.save(songList: songList)
                return SongViewParam.create(songList: songList)
        }
    }

}
