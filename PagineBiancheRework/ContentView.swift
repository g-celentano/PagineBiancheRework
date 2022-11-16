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

   /* @FetchRequest(
        sortDescriptors: [],
        animation: .default)
    private var items: FetchedResults<Item>*/

    var body: some View {
        ZStack{
            TabView{
                SearchView()
                    .tabItem{Label("Search",systemImage: "magnifyingglass")}
                SpecialResearchMainView()
                    .tabItem{
                        Label("Special Researches", systemImage: "sparkle.magnifyingglass")
                    }
            }
            
        }
        .frame(width: width, height: height)
    }
    

   
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
