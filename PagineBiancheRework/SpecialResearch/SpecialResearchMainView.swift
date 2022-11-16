//
//  SpecialResearchView.swift
//  PagineBiancheRework
//
//  Created by Gaetano Celentano on 16/11/22.
//

import SwiftUI

struct SpecialResearchMainView: View {
    
    @State var specials = [
        "Calculate Tax Code",
        "Find ZIP Code",
        "National Prefix",
        "International Prefix",
        "Procedures and Documents"
    ]
    
    var body: some View {
            NavigationStack{
                VStack{
                    HStack{
                        Text("Special Researches")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .frame(width: width*0.9, alignment: .leading)
                    .padding(.top,height*0.01)
                        
                    List{
                        ForEach(specials, id: \.self) { special in
                            HStack{
                                Text(special)
                                Spacer()
                                Button(action:{}){
                                    Image(systemName: "chevron.right")
                                    
                                }
                           }
                       }
                       .onDelete { specials.remove(atOffsets: $0) }
                    }
                    .cornerRadius(20)
                    .frame(width: width*0.95)
                    .padding(.top, height*0.015)
                    .scrollContentBackground(.hidden)
                    
                    
                    
                    
                }
                .frame(width: width, alignment: .top)
                .background(Color("bg"))
                
                
            }
            
        
        
    }
}

struct SpecialResearchMainView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialResearchMainView()
    }
}
