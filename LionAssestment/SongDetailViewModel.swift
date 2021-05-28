//
//  SongDetailViewModel.swift
//  LionAssestment
//
//  Created by Felix Cary Giovanni on 28/05/21.
//

import Foundation
import RxSwift
import RxCocoa

class SongDetailViewModel {
    
    var songViewParam = SongViewParam()
    
    func setDetail(songDetail: SongViewParam) {
        self.songViewParam = songDetail
    }
    
}


