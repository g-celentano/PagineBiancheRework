//
//  ProceduresView.swift
//  PagineBiancheRework
//
//  Created by Gaetano Celentano on 17/11/22.
//

import SwiftUI

struct ProceduresView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationStack{
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
                        Text("Procedures View")
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
                
                Spacer()
            }
        }
    }
}

struct ProceduresView_Previews: PreviewProvider {
    static var previews: some View {
        ProceduresView()
    }
}
