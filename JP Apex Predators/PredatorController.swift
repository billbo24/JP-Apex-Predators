//
//  PredatorController.swift
//  JP Apex Predators
//
//  Created by William Floyd on 2/18/23.
//

import Foundation

//Want to make a predator controller
class PredatorController{
    var apexPredators:[ApexPredator] = [] //will be changing this later on so it's var, not let
    
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
                apexPredators = try decoder.decode([ApexPredator].self, from: data)
                
            } catch {
                //the backslash here looks like how you can enter a variable or property into a string
                print("Error decoding JSON data: \(error)")
            }
        }
    }
    
}
