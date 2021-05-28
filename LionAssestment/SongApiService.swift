//
//  SongApiService.swift
//  LionAssestment
//
//  Created by Felix Cary Giovanni on 28/05/21.
//

import Foundation
import RxSwift
import ObjectMapper

class SongApiService: SongApi {
    let apiClient: ApiServiceProtocol
    
    init(apiClient: ApiServiceProtocol) {
        self.apiClient = apiClient
    }
    
    func getSongList() -> Single<[Song]> {
        return apiClient.getString(path: "/search?q=maroon 5")
            .map { (success, jsonString) in
                Mapper<SongListDataReponse>().map(JSONString: jsonString)?.toSongList() ?? [Song]()
        }
    }
    
    func getSongDetails(songId: Int) -> Single<Song> {
        return apiClient.getString(path: "/track/\(songId)")
            .map { (success, jsonString) in
                Mapper<SongListReponse>().map(JSONString: jsonString)?.toSong() ?? Song()
        }
    }
    
}
