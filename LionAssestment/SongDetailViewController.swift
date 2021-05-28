//
//  SongDetailViewController.swift
//  LionAssestment
//
//  Created by Felix Cary Giovanni on 28/05/21.
//

import UIKit

class SongDetailViewController: UIViewController {
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var artistImageView: UIImageView!
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var albumName: UILabel!
    
    var songDetailViewModel: SongDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    func setDetail(songDetail: SongViewParam) {
        songDetailViewModel.setDetail(songDetail: songDetail)
    }
    
    private func setData() {
        let songDetail = songDetailViewModel.songViewParam
        albumImageView.load(urlString: songDetail.albumCover)
        songName.text = songDetail.title
        artistName.text = songDetail.artistName
        albumName.text = songDetail.albumTitle
        artistImageView.load(urlString: songDetail.artistPicture)
    }
}
