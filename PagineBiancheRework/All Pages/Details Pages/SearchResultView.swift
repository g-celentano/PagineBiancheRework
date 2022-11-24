//
//  PostOffices.swift
//  PagineBiancheRework
//
//  Created by Gaetano Celentano on 18/11/22.
//

import SwiftUI

struct SearchResultView: View {
    @State var search : String = ""
    @State var location : String = ""
    @State var searchFav = "star"
    @State var defaultSearch : Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var moc
    
    @State var moreView = false
    @State var selection = ""
    
    @FetchRequest(sortDescriptors: [], animation: .default) var favs: FetchedResults<Favs>
    
    @State var infos = [
        "Corso G. Garibaldi, 78, 80142, Napoli ",
        "Via Casanova, 46, 80143, Napoli",
        "Corso Meridionale, 54, 80143, Napoli",
        "Vico Polveriera, 4, 80141, Napoli"
    ]
    

 
    
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .foregroundColor(Color("primary"))
                HStack{
                    Button(action:{
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .scaleEffect(width*0.003)
                    }
                    Text("Search Results")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.leading, width*0.03)
                }
                .frame(width: width*0.9, alignment: .leading)
                .padding(.top, height*0.11)
                .padding(.bottom, height*0.012)
            }
            .frame(width: width, height: height*0.1)
            .ignoresSafeArea()
            
            HStack{
               /* Text("Result for \(search):")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom)*/
                
                Spacer()
                if self.defaultSearch {
                    Button (action:{
                        
                        if searchFav == "star.fill" {
                            withAnimation(.linear(duration: 0.001)){
                               searchFav =  "star"
                            }
                            let newFav = Favs(context: moc)
                            newFav.name = search
                            try? moc.save()
                        } else {
                            withAnimation(.linear(duration: 0.001)){
                               searchFav =  "star.fill"
                            }
                            let deleteFav = Favs(context: moc)
                            deleteFav.name = search
                            moc.delete(deleteFav)
                            try? moc.save()
                        }
                        
                    }){
                        Image(systemName: searchFav)
                            .scaleEffect(width*0.003)
                    }
                }

            }
            .frame(width: width * 0.9, alignment: .leading)
            
           
            
            ScrollView{
                
                ForEach(0...3, id: \.self){ index in
                   
                        HStack{
                            ZStack{
                                Circle()
                                    .frame(width: width*0.13)
                                    .foregroundColor(Color("iconBG"))
                                Image(systemName: "point.topleft.down.curvedto.point.bottomright.up")
                                    .scaleEffect(width*0.0035)
                                    .foregroundColor(Color("primary"))
                                
                            }
                            .padding(.leading, width*0.025)
                            VStack{
                                HStack{
                                    Text("\(search)")
                                        .font(.title3)
                                        
                                }
                                .frame(width:width*0.6, alignment: .leading)
                                HStack{
                                    Text(infos[index])
                                        .font(.caption)
                                }.frame(width:width*0.6, alignment: .leading)
                                    
                            }
                            
                            Spacer()
                            Button(action:{
                                moreView.toggle()
                            })
                            {
                                Image(systemName: "ellipsis")
                                 
                                    .scaleEffect(width*0.0035)
                            }
                            .confirmationDialog(
                                "Actions for \(search)",
                                isPresented: $moreView,
                                titleVisibility: .visible) {
                                    Button("Call") {
                                        selection = "Call"
                                    }

                                    Button("Take me there") {
                                        selection = "Take Me There"
                                    }

                                    Button("Add to Favourite") {
                                        selection = "Favs"
                                      /*  let newFav = Favs(context: moc)
                                        newFav.name = "\(search) search result \(localIndex)"
                                        try? moc.save()*/
                                    }
                                }
                            .padding(.trailing, width*0.05)
                        }
                        .frame(width: width * 0.95  , height: height*0.065)
                       
                    
                    Rectangle()
                        .frame(width: width*0.875, height: height*0.001)
                        .foregroundColor(.gray)
                    
                        
                        
                      
                   
                }
                
            }
            .frame(maxWidth: width*0.97, maxHeight: .infinity)
               
           
            
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .background(Color(UIColor.secondarySystemBackground))
        
        
    }
}
struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(search: "Ciao mondo")
    }
}
