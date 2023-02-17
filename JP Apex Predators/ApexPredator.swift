//
//  ApexPredator.swift
//  JP Apex Predators
//
//  Created by William Floyd on 2/16/23.
//

import Foundation


struct ApexPredator: Codable {
    //I believe the codable keyword allows us to populate this from JSON data
    let id: Int //This will be the dinosaur ID
    let name: String //dinosaur name
    let type: String //type of dinosaur
    let movies: [String] //the brackets here denote this is an array of strings
    let movieScenes: [MovieScene] //recall that this is an array of dictionaries...well we might as well implement these dictionaries as their own objects.  Did that below
    let link: String 
}

struct MovieScene: Codable {
    let id: Int //movie scene number
    let movie: String
    let sceneDescription: String //
}
