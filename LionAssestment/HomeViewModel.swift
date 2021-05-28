//
//  HomeViewModel.swift
//  LionAssestment
//
//  Created by Felix Cary Giovanni on 28/05/21.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
    
    var rxEventLoadData: Observable<Void> {
        return eventLoadData
    }
    
    private (set) var songListViewParam = [SongViewParam]()
    
    private let eventLoadData = PublishSubject<Void>()
    private let displaySong: DisplaySongProtocol
    private let disposeBag = DisposeBag()
    
    init(displaySong: DisplaySongProtocol) {
        self.displaySong = displaySong
    }
    
    func viewDidLoad() {
        getAllSong()
    }
    
    private func getAllSong() {
        displaySong.getAllSong()
            .subscribe(onSuccess: { [weak self] songListViewParam in
                guard let weakSelf = self else { return }
                weakSelf.songListViewParam = songListViewParam
                weakSelf.eventLoadData.onNext(())
        }).disposed(by: disposeBag)
    }
    
    
}

