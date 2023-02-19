//
//  ApexPredator.swift
//  JP Apex Predators
//
//  Created by William Floyd on 2/16/23.
//

import Foundation
import SwiftUI

struct ApexPredator: Codable, Identifiable {
    
    //I believe the codable keyword allows us to populate this from JSON data
//    I think this Identifiable mumbo jumbo allows us to loop through the apex predator type.  In the other app, we only ever looped through numbers, but this apex predator may not be unique or some shit, so we add this.  
    
    let id: Int //This will be the dinosaur ID
    let name: String //dinosaur name
    let type: String //type of dinosaur
    let movies: [String] //the brackets here denote this is an array of strings
    let movieScenes: [MovieScene] //recall that this is an array of dictionaries...well we might as well implement these dictionaries as their own objects.  Did that below
    let link: String
    
    
    //Alrighty going to add a function as well.  Now, I know what you're thinking: don't functions go in the controller? And generally you'd be correct, but that's really more of an artifical construct.  The controller was designed to really work with the entire collection of predators at once.  We want to add a function that will be particular to an individual dinosaur so it makes a little more sense to put that here in this case.
    func typeOverlay() -> Color {
        //Honestly I don't follow what switch means lol.  He's saying it's similar to an if statement.  It feels similar to a for each
        switch type {
            //In the case that our type is land
        case "land": return .brown
        case "air": return .teal
        case "sea":return .blue
        default: return .yellow //This helps make our cases exhaustive
            
        }
    }
}

struct MovieScene: Codable {
    let id: Int //movie scene number
    let movie: String
    let sceneDescription: String //
}
