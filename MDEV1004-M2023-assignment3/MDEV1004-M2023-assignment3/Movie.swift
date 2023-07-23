//
//  Movie.swift
//  MDEV1004-M2023-assignment3
//
//  Created by Divya Patel on 2023-07-23.
//

import Foundation

struct Movie: Codable {
    let movieID: String?
    let title: String?
    let studio: String?
    let genres: [String]?
    let directors: [String]?
    let writers: [String]?
    let actors: [String]?
    let year: Int?
    let length: Int?
    let shortDescription: String?
    let mpaRating: String?
    let criticsRating: Double?
}
