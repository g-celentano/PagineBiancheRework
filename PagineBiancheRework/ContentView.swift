//
//  ContentView.swift
//  PagineBiancheRework
//
//  Created by Gaetano Celentano on 16/11/22.
//

import SwiftUI
//import CoreData

let width = UIScreen.main.bounds.width
let height = UIScreen.main.bounds.height

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

 
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("buttonColor"))
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color("unselectedColor"))
    }

    var body: some View {
        NavigationStack{
            ZStack{
                TabView{
                    SearchView()
                        .tabItem{Label("Search",systemImage: "magnifyingglass")}
                    
                    SpecialResearchMainView()
                        .tabItem{Label("Special Researches", systemImage: "sparkle.magnifyingglass")}
                    
                    UsefulNumbersView()
                        .tabItem {Label("Useful Numbers", systemImage: "phone.circle")}
                    
                    
                }
                .accentColor(.white)
                
                
                
            }
            .frame(width: width, height: height)
        }
    }
    

   
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
