//
//  ZipCodeView.swift
//  PagineBiancheRework
//
//  Created by Gaetano Celentano on 17/11/22.
//

import SwiftUI

struct ZipCodeView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var searchValue = ""
    @State var loadingDegree = 0.0
    @State var opct = 0.0
    @State var textOpct = 0.0
    @State var temp : [String] = []
    @State var cities = [
        "Napoli",
        "Milano",
        "Roma",
        "Verona",
        "Bergamo"
    ]
    @State var caps = [
        "80121 - 80147",
        "20121 - 20162",
        "00118 - 00199",
        "37121 - 37142",
        "24121 - 24129"
    ]
    
    // 0 - comune
    // 1 - provincia
    // 2 - prefisso
    // 3 - cap
    // 4 - codice belfiore
    
    
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
                        Text("Find your zip code")
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
                            /*textOpct = 0.0
                            opct = 1.0
                            loadingDegree = 0
                            withAnimation(.linear(duration: 3)){
                                loadingDegree = 720
                                
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.01) {
                                opct = 0.0
                                textOpct = 1.0
                            }
                            */
                            if(!searchValue.isEmpty){
                                /*let t = r.filter({ s in
                                    s.contains(searchValue)
                                })
                                let prov = t[0].split(separator: ";")[1]
                                
                                temp = r.filter({ s in
                                    s.contains(prov)
                                })
                                */
                                temp = r.filter({ s in
                                    s.contains(searchValue)
                                })
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
                
                Spacer()
                
                /*ZStack{
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
                    .opacity(textOpct)*/
                    
                    ScrollView{
                        ForEach(0..<temp.count, id: \.self){ index in
                            let result = temp[index].split(separator: ";")
                            HStack{
                                ZStack{
                                    Circle()
                                        .frame(width: width*0.13)
                                        .foregroundColor(Color("iconBG"))
                                    Image(systemName: "mappin")
                                        .scaleEffect(width*0.0035)
                                        .foregroundColor(Color("primary"))
                                    
                                }
                                .padding(.leading, width*0.025)
                                
                                VStack{
                                    HStack{
                                        
                                        Text(String(result[0]))
                                            .font(.title3)
                                        
                                    }
                                    .frame(width:width*0.6, alignment: .leading)
                                    HStack{
                                        Text(String(result[3]))
                                            .font(.caption)
                                    }.frame(width:width*0.6, alignment: .leading)
                                    
                                }
                                Spacer()
                                
                                
                            }
                            .frame(width: width * 0.95  , height: height*0.065)
                            Rectangle()
                                .frame(width: width*0.875, height: height*0.001)
                                .foregroundColor(.gray)
                        }
                    }.frame(maxWidth: width*0.97, maxHeight: .infinity)
                        //.opacity(opct == 1.0 ? 1.0 - opct : 1.0 - textOpct)
                    
                    
                    
                    
                }
                Spacer()
            }
            .background(Color(UIColor.secondarySystemBackground))
        }
    }


struct ZipCodeView_Previews: PreviewProvider {
    static var previews: some View {
        ZipCodeView()
    }
}
