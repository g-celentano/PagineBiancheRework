//
//  NationalPrefixView.swift
//  PagineBiancheRework
//
//  Created by Gaetano Celentano on 17/11/22.
//

import SwiftUI

struct NationalPrefixView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var searchValue = ""
    @State var loadingDegree = 0.0
    @State var opct = 0.0
    @State var textOpct = 0.0
    @State var cities = [
        "Napoli",
        "Milano",
        "Roma",
        "Verona",
        "Bergamo",
    ]
    @State var prefix = [
        "081",
        "02",
        "06",
        "045",
        "035",
    ]
    
    
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
                        Text("National Prefix")
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
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, width*0.02)
                    TextField("City, street and number or zip code", text: $searchValue)
                        .submitLabel(.search)
                        .onSubmit {
                            textOpct = 0.0
                            opct = 1.0
                            loadingDegree = 0
                            withAnimation(.linear(duration: 3)){
                                loadingDegree = 720
                                
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.01) {
                                opct = 0.0
                                textOpct = 1.0
                            }
                            
                        }
                    Spacer()
                    Button(action:{
                        searchValue = ""
                    }){
                        Image(systemName: searchValue.isEmpty ? "" : "x.circle.fill")
                            .padding(.trailing, width*0.02)
                            .foregroundColor(.gray)
                    }
                }
                .frame(width: width * 0.95, height: height * 0.05)
                .background(Color(UIColor.lightGray).opacity(0.3))
                .cornerRadius(10)
                .padding(.top, -width*0.05)
                
                
                ZStack{
                    ZStack{
                        Circle()
                            .frame(width: width*0.12)
                            .foregroundColor(Color("primary"))
                        Circle()
                            .frame(width: width*0.1)
                            .foregroundColor(Color(UIColor.secondarySystemBackground))
                        Rectangle()
                            .frame(width: width*0.02, height: width*0.02)
                            .padding(.leading, width*0.1)
                            .foregroundColor(Color(UIColor.secondarySystemBackground))
                    }
                    .rotationEffect(.degrees(loadingDegree))
                    .opacity(opct)
                    
                    
                    ZStack{
                        Text("The search could not find any result")
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    .opacity(textOpct)
                    
                    List{
                        
                        ForEach(0..<5){ index in
                            Section{
                                VStack{
                                    HStack{
                                        Text(cities[index])
                                            .font(.headline)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    HStack{
                                        Text(prefix[index])
                                            .font(.caption)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            } header: {
                                Text(cities[index].prefix(1))
                            }
                        }
                        
                    }
                    .scrollContentBackground(.hidden)
                    .opacity(opct == 1.0 ? 1.0 - opct : 1.0 - textOpct)
                    
                    
                }
                
            }
            .background(Color(UIColor.secondarySystemBackground))
        }
    }
}

struct NationalPrefixView_Previews: PreviewProvider {
    static var previews: some View {
        NationalPrefixView()
    }
}
