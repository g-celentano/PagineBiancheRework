//
//  SearchView.swift
//  PagineBiancheRework
//
//  Created by Gaetano Celentano on 16/11/22.
//

import SwiftUI


struct SearchView: View {
    @State private var favs = [
        "Post Offices",
        "Pharmacies",
        "Insurance",
    ]
    
    @State private var isSearching = false

    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                   /*Button{
                        
                    }label: {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(Color("mainColor"))
                            .scaleEffect(width*0.004)
                    }*/
                    Text("Search")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    Button{
                        isSearching.toggle()
                    }label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color("mainColor"))
                            .scaleEffect(width*0.004)
                    }
                    .sheet(isPresented: $isSearching){
                        SearchModal()
                            .presentationDetents([.medium])
                        
                        
                    }
                    
                    
                }
                .frame(width: width*0.9)
                List{
                    Section{
                        ForEach(favs, id: \.self) { fav in
                            HStack{
                                Text(fav)
                                Spacer()
                                Button(action:{}){
                                    Image(systemName: "chevron.right")
                                    
                                }
                           }
                       }
                       .onDelete { favs.remove(atOffsets: $0) }
                    }header: {
                        Text("Favourites")
                    }
                    
                }
                .cornerRadius(20)
                .frame(width: width*0.95)
                .padding(.top, height*0.015)
                .scrollContentBackground(.hidden)
                
                
                
            }
            .padding(.top, height*0.01)
            .frame(width: width)
            .background(Color("bg"))
            .blur(radius: isSearching ? 2 : 0)
            
        }
        
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
