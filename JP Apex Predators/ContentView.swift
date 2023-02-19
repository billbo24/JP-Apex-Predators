//
//  ContentView.swift
//  JP Apex Predators
//
//  Created by William Floyd on 2/16/23.
//

import SwiftUI

struct ContentView: View {
    
    //Remember it will decode our JSON data as soon as we call it
    let apController = PredatorController()
    
    
    var body: some View {
        NavigationView() {
            List {
                ForEach(apController.apexPredators) {
                    predator in
                    NavigationLink(destination: Text("Dino details go here")) {
                        //Text(predator.name)
                        //Damn this is really slick.
                        PredatorRow(predator:predator)
                    }
                }
            }
            .navigationTitle("Apex Predators")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
