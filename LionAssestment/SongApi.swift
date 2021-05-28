//
//  SongApi.swift
//  LionAssestment
//
//  Created by Felix Cary Giovanni on 28/05/21.
//

import Foundation
import RxSwift

protocol SongApi {
    func getSongList() -> Single<[Song]>
    func getSongDetails(songId: Int) -> Single<Song>
}
