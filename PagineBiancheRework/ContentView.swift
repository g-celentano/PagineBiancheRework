//
//  ContentView.swift
//  PagineBiancheRework
//
//  Created by Gaetano Celentano on 16/11/22.
//

import SwiftUI
//import CoreData

public extension String {
    func contentsOrBlank()->String {
        if let path = Bundle.main.path(forResource:self , ofType: nil) {
            do {
                let text = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
                return text
                } catch { print("Failed to read text from bundle file \(self)") }
        } else { print("Failed to load file from bundle \(self)") }
        return ""
    }
    }

let width = UIScreen.main.bounds.width
let height = UIScreen.main.bounds.height

struct InfoComune {
    var comune : String
    var provincia : String
    var prefisso : String
    var CAP : String
    var cod : String
}


let r : [String] = "listacomuni2.txt"
     .contentsOrBlank()
     .replacingOccurrences(of: "\r\n", with: "~")
     .split(separator: "~")
     .map(String.init)


struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    init() {
        UITextField.appearance().tintColor = UIColor(.white)
        UITabBar.appearance().backgroundColor = UIColor(Color("primary"))
        UITabBar.appearance().unselectedItemTintColor = UIColor(.white.opacity(0.4))
        
       
        
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
                        .tabItem {Label("Useful Numbers", systemImage: "phone.fill")}
                    
                    
                }
                .accentColor(.white)
                
                
                
            }
            .frame(width: width)
            
        }
    }
    

   
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
