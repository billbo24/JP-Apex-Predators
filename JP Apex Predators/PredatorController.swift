//
//  PredatorController.swift
//  JP Apex Predators
//
//  Created by William Floyd on 2/18/23.
//

import Foundation

//Want to make a predator controller
class PredatorController{
    private var allApexPredators: [ApexPredator] = [] //I think private means only stuff in this file can access this variable
    var apexPredators:[ApexPredator] = [] //will be changing this later on so it's var, not let
    let typeFilters = ["All","Land","Air","Sea"]
    
    init() {
        //Apparently this is where we can put code to get executed the moment we initialize our predator controller
        decodeApexPredatorData()
    }
    
    //Apparently Bundle.main.url is how we reference the current project.  I think this code says return the url of jpapexpredators.json from the main bundle.
    func decodeApexPredatorData(){
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            //We say if as a way to prevent this breaking in case the file doesn't exist
            //do try catch looks like try, except in python
            do { //apparently it's good practice to do this sort of thing when working with external files since external files are a frequent source of error
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase //snake case is writing stuff like my_name_is, whereas camel case is myNameIs.  The first letter is generally lowercase with camel case I think
                //Admittedly I don't really understand the self thing here.  I know this is common in python but
                allApexPredators = try decoder.decode([ApexPredator].self, from: data)
                apexPredators = allApexPredators
            } catch {
                //the backslash here looks like how you can enter a variable or property into a string
                print("Error decoding JSON data: \(error)")
            }
        }
    }
    
    func typeIcon(for type: String) -> String {
        switch type {
        case "All": return "square.stack.3d.up.fill"
        case "Land": return "leaf.fill"
        case "Air": return "wind"
        case "Sea": return "drop.fill"
        default: return "questionmark"
        }
    }
    
    //Filtering is NOT an in place function.  It creates a sort of temporary variable that we have to put somewhere.  Naturally we just overwrite the thing we're filtering here.
    func filterBy(type:String) {
        switch type {
        case "Land","Air","Sea":
            apexPredators = allApexPredators.filter{
                $0.type == type.lowercased() //anything true it keeps, anything false it removes
        
            }
        default: apexPredators = allApexPredators
        }
    }
    //sort is an "in place" function.  The apexPredators array gets sorted basically right where it stands
    func sortByAlphabetical () {
        //Apparently this sorts by alphabetical order? the $0 and $1 apparently look at all objects??? Look this up
        apexPredators.sort(by:{$0.name < $1.name})
    }
    
    func sortByMovieAppearance() {
        apexPredators.sort(by: {$0.id < $1.id})
    }
    
}
