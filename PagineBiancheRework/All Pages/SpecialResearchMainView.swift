//
//  SpecialResearchView.swift
//  PagineBiancheRework
//
//  Created by Gaetano Celentano on 16/11/22.
//

import SwiftUI

struct SpecialElement: Hashable {
    var name : String
}

struct SpecialResearchMainView: View {
    
    @FetchRequest(
         sortDescriptors: [],
         animation: .default)
     private var favs: FetchedResults<Favs>
    
    @Environment(\.managedObjectContext) private var moc
    
    @State var specials  = [
        "Calculate Tax Code",
        "Find Zip Code",
        "National Prefix",
        "International Prefix",
        "Procedures and Documents"
    ]
    
   
    
    var body: some View {
                VStack{
                    ZStack{
                        Rectangle()
                            .foregroundColor(Color("buttonColor"))
                        HStack{
                            Text("Special Researches")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .frame(width: width*0.9, alignment: .leading)
                        .padding(.top, height*0.11)
                        .padding(.bottom, height*0.012)
                    }
                    .frame(width: width, height: height*0.1)
                        
                    List{
                        ForEach(specials, id: \.self) { special in
                            NavigationLink(destination: HandleSelection(selected: special)) {
                                    Text(special)
                                }
                                .swipeActions(edge: .trailing, allowsFullSwipe: false){
                                    Button(action:{
                                        let fav = Favs(context: moc)
                                        fav.name = special
                                        try? moc.save()
                                        moc.refreshAllObjects()
                                    })
                                    {
                                        Image(systemName: favs.contains(where: {$0.name == special}) ? "star.slash" : "star")
                                    }
                                    .tint(Color("favsColor"))
                                }
                       }
                        .listRowBackground(Color("listBG"))
                        
                       
                    }
                    .cornerRadius(20)
                    .frame(width: width*0.95)
                    .padding(.top, height*0.02)
                    .scrollContentBackground(.hidden)
                    
                    
                    
                    
                    
                }
                .frame(width: width, alignment: .top)
                .background(Color("bg"))
                .ignoresSafeArea()
               
    }
}

struct SpecialResearchMainView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialResearchMainView()
    }
}
