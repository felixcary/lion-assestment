//
//  SongListCell.swift
//  LionAssestment
//
//  Created by Felix Cary Giovanni on 28/05/21.
//

import UIKit

class SongListCell: UITableViewCell {
    
    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
    
    static func cellReuseIdentifier() -> String {
        return String(describing: self)
    }
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!

    func setData(songViewParam: SongViewParam) {
        albumImage.load(urlString: songViewParam.albumCover)
        songLabel.text = songViewParam.title
        artistLabel.text = songViewParam.artistName
        albumLabel.text = songViewParam.albumTitle
    }
    
}

