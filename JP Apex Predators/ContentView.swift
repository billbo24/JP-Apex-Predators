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
    
    //According the lesson, @state is for when you plan on changing the value of the property somewhere within the view.  it's changing the state of the view, hence is a state var.  Basically I think it's like: if this is going to change, and the view itself depends on it, and will change with this thing, then make it a state
    @State var sortAlphabetical = false
    //Okay it looks like state variables when they change refresh the page
    
    //Type () cannot conform to view is the compilers way of saying we need a return keyword.  Well actually that's kind wrong.  this var body thing is actually something that it might return.  If you look all the navigation view stuff is actually sort of one line of code and since it's only one line then the compiler would assume we're returning that.  Now that we have two separate lines of code it doesn't know which thing we're actually returning, so we're telling it to return to navigation view
    
    @State var currentFilter = "All"
    
    
    var body: some View {
        //It is this easy.
        apController.filterBy(type: currentFilter)
        
        if sortAlphabetical {
            apController.sortByAlphabetical() //this sorts the list alphabetically
        } else {
            apController.sortByMovieAppearance() //Apparently this sorts it by movie
        }
        
        //Remember we have an invisible return keyword here
        return NavigationView() {
            List {
                ForEach(apController.apexPredators) {
                    predator in
                    NavigationLink(destination: PredatorDetail(predator: predator)) {
                        //Text(predator.name)
                        //Damn this is really slick.
                        PredatorRow(predator:predator)
                    }
                }
            }
            .navigationTitle("Apex Predators")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        withAnimation{ //This jazzes up the sorting.  Not sure why this has to be wrapped in the withAnimation function, but the one below is just .animation()
                            //A state change apparently makes it refresh EVERYTHING.  This is why we can sort up above, but toggle the boolean down here
                            sortAlphabetical.toggle()
                        }
                    } label: { //it looks like the convention is to put the label on the same line as the other bracket
                        
                        //Think: where do we actually determine the order of the list? Oddly enough it's in the predator controller where we read the data.  So we will add something there which will sort our list
                        if sortAlphabetical {
                            //This is like python, where if sortAlphabetical means if it's true
                            Image(systemName: "film")
                        } else {
                            Image(systemName: "textformat")
                        }
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Menu {
                        //This is where we're going to build the little menu that pops up
                        //I thought we had to define this as a bound variable, but I guess we only have to do that "inside" the picker
                        
                        //Adding the animation was much easier than I thought it would be.  For the filter thing we do .animation()
                        Picker("Filter",selection: $currentFilter.animation()) {
                            ForEach(apController.typeFilters, id: \.self){
                                type in
                                HStack {
                                    Text(type)
                                    
                                    Spacer()
                                    
                                    Image(systemName: apController.typeIcon(for: type))
                                }
                                
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
