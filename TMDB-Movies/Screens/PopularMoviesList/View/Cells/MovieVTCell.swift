//
//  MovieVTCell.swift
//  TMDB-Movies
//
//  Created by Roman Radchuk on 11.08.2022.
//

import UIKit

class MovieVTCell: UITableViewCell, NibLoadableView {
    
    @IBOutlet private var posterImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    
    var isPaginationTrigger: Bool = false
    
    func configure(with model: Movie) {
        nameLabel.text = model.title
    }
    
    func configureForPagination() {
        posterImageView.image = nil
        nameLabel.text = nil
        isPaginationTrigger = true
    }
}
