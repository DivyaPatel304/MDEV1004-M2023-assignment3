//
//  MovieTableViewCell.swift
//  MDEV1004-M2023-assignment3
//
//  Created by Divya Patel on 2023-07-23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var studioLabel: UILabel?
    @IBOutlet weak var ratingLabel: UILabel?
    
    func configure(with movie: Movie) {
        titleLabel?.text = movie.title
        studioLabel?.text = movie.studio
        ratingLabel?.text = "\(movie.criticsRating ?? 0)"
        
        // Set the background color of ratingLabel based on the rating
        if let rating = movie.criticsRating {
            if rating > 7 {
                ratingLabel?.backgroundColor = UIColor.green
                ratingLabel?.textColor = UIColor.black
            } else if rating > 5 {
                ratingLabel?.backgroundColor = UIColor.yellow
                ratingLabel?.textColor = UIColor.black
            } else {
                ratingLabel?.backgroundColor = UIColor.red
                ratingLabel?.textColor = UIColor.white
            }
        } else {
            ratingLabel?.backgroundColor = UIColor.gray
            ratingLabel?.textColor = UIColor.black
        }
    }
}
