//
//  SearchView.swift
//  PagineBiancheRework
//
//  Created by Gaetano Celentano on 16/11/22.
//

import SwiftUI


struct SearchView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(sortDescriptors: [], animation: .default) var favs: FetchedResults<Favs>
    
    @State var defaults = [
        "Post Offices",
        "Pharmacies",
        "Insurance",
        "Green Numbers"
    ]
    
    @State private var isSearching = false

    
    var body: some View {
            VStack{
                ZStack{
                    Rectangle()
                        .foregroundColor(Color("buttonColor"))
                    HStack{
                        Text("Search")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                        Button{
                            isSearching.toggle()
                        }label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white)
                                .scaleEffect(width*0.004)
                        }
                        .sheet(isPresented: $isSearching){
                            SearchModal()
                                .presentationDetents([.medium])
                        }
                        
                        
                    }
                    .frame(width: width*0.9)
                    .padding(.top, height*0.11)
                    .padding(.bottom, height*0.012)
                }
                .frame(width: width, height: height*0.1)
                
                
                List{
                    Section{
                        ForEach(defaults, id: \.self) { def in
                            NavigationLink(destination: HandleSelection(selected: def), label: {
                                Text(def)
                            })
                        }
                        .listRowBackground(Color("listBG"))
                    }header: {
                        Text("Default")
                    }
                    
                    Section{
                        ForEach(favs, id: \.self) { fav in
                            NavigationLink(destination: HandleSelection(selected: fav.name ?? ""), label: {
                                Text(fav.name ?? "")
                            })
                            .swipeActions(edge: .trailing, allowsFullSwipe: false){
                                Button(action:{
                                    viewContext.delete(fav)
                                    try? viewContext.save()
                                    viewContext.refreshAllObjects()
                                })
                                {
                                    Image(systemName: "star.slash")
                                }
                                .tint(Color("favsColor"))
                                
                            }
                       }
                        .listRowBackground(Color("listBG"))
                        
                    }header: {
                        Text("Favourites")
                    }
                    .opacity(favs.count == 0 ? 0.0 : 1.0)
                    
                }
                .cornerRadius(20)
                .frame(width: width*0.95)
                .padding(.top, height*0.05)
                .scrollContentBackground(.hidden)
            }
            .frame(width: width)
            .background(Color("bg"))
            .blur(radius: isSearching ? 2 : 0)
            .ignoresSafeArea()
        
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
