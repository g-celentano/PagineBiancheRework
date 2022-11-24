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
    
    @State var searchInfo1 = ""
    @State var searchInfo2 = ""
    @State var h : CGFloat = 0.0
    
    

    
    var body: some View {
            VStack{
               
                    ZStack{
                        
                        Rectangle()
                            .foregroundColor(Color("primary"))
                        HStack{
                            Text("Search")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
                           
                            Button{
                                withAnimation {
                                  h = h == 0.0 ? height * 0.35 : 0.0
                                }
                                
                            }label: {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.white)
                                    .scaleEffect(width*0.004)
                            }
                            
                            
                        }
                        .frame(width: width*0.9)
                        .padding(.top, height*0.11)
                        .padding(.bottom, height*0.012)
                       
                    }
                    .frame(width: width, height: height*0.1)
                    .edgesIgnoringSafeArea(.top)
                    
                
                List{
                    Section{
                        ForEach(defaults, id: \.self) { def in
                            NavigationLink(destination: HandleSelection(selected: def), label: {
                                Text(def)
                            })
                        }
                        //.listRowBackground()
                    }header: {
                        Text("DEFAULT")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("listSectionTitle"))
                            
                    }
                    
                    
                    Section{
                        ForEach(favs, id: \.self) { fav in
                            NavigationLink(destination: HandleSelection(selected: fav.name ?? "", defaultSearch: true), label: {
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
                                .tint(Color("primary"))
                                
                            }
                       }
                        
                    }header: {
                        Text("FAVOURITES")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("listSectionTitle"))
                    }
                    .opacity(favs.count == 0 ? 0.0 : 1.0)
                    
                }
                .cornerRadius(15)
                .frame(width: width*0.95)
                .padding(.trailing,width*0.01)
                .scrollContentBackground(.hidden)
                
                SearchModal(h: $h)
                    .frame(width: width, height: h)
                    .padding(.top, height*0.02)
                    .opacity(h == 0 ? 0.0 : 1.0)
                    
               
            }
            .frame(width: width)
            //.blur(radius: isSearching ? 2 : 0)
            .background(Color(UIColor.secondarySystemBackground))
            
        
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
