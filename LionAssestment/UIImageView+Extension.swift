//
//  UIImageView+Extension.swift
//  LionAssestment
//
//  Created by Felix Cary Giovanni on 28/05/21.
//

import UIKit

extension UIImageView {
    func load(urlString: String) {
        let url = URL(string: urlString)!
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
