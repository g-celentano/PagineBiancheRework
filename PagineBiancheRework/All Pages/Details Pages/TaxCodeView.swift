//
//  TaxCodeView.swift
//  PagineBiancheRework
//
//  Created by Gaetano Celentano on 17/11/22.
//

import SwiftUI

struct TaxCodeView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var result = ""
    @State var name = ""
    @State var surname = ""
    @State var sex = ""
    @State var birthDate : Date = Date()
    @State var birthDateString = ""
    @State var birthPlace : String = ""
    let vocals = ["A","E","I","O","U"]
    let cons = ["B","C","D","F","G","H","J","K","L","M","N","P","Q","R","S","T","U","V","W","X","Y","Z"]
    let alph = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    let pari = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]
    let dispari = [1,0,5,7,9,13,15,17,19,21,2,4,18,20,11,3,6,8,12,14,16,10,22,25,24,23]
    
    
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
                        Text("Tax Code")
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
                
                
                Text(result.uppercased())
                    .font(.title)
                    .foregroundColor(Color("primary"))
                    .fontWeight(.semibold)
                    .tracking(5)
                    .frame(width: width*0.9, height:  height*0.05)
                    .overlay {
                        ZStack{
                            Rectangle()
                                .frame(width: width*0.9, height: height*0.001)
                                .foregroundColor(.gray)
                        }
                        .frame(width: width*0.9, height: height*0.04, alignment: .bottom)
                    }
                
                List{
                    
                    TextField("Name", text: $name)
                    TextField("Surname", text: $surname)
                    HStack{
                        TextField("Gender", text:$sex).disabled(true)
                        Spacer()
                        Picker("", selection: $sex){
                            Text("M")
                                .tag("M")
                            Text("F")
                                .tag("F")
                        }
                        .frame(width: width*0.4)
                        //.pickerStyle(.segmented)
                    }
                    HStack{
                        TextField("Pick a date", text: $birthDateString)
                            .onChange(of: birthDate) { newValue in
                                birthDateString = birthDate.formatted(date:.numeric, time: .omitted)
                            }
                            .disabled(true)
                        Spacer()
                        DatePicker(selection: $birthDate, displayedComponents: .date) {
                            EmptyView()
                        }
                    }
                    TextField("Place of Birth", text: $birthPlace)
                    
                }
                //.scrollDisabled(true)
                //.padding(.top, height*0.05)
                .frame(width: width)
                .scrollContentBackground(.hidden)
                
                Spacer()
                
                Button (action:{
                    if !name.isEmpty && !surname.isEmpty && !sex.isEmpty && !birthDateString.isEmpty && !birthPlace.isEmpty {
                        var temp = ""
                        var index : String.Index
                        
                        temp = surname.filter({ char in
                            cons.contains(char.uppercased())
                            })
                        index = temp.index(temp.startIndex, offsetBy: 3)
                        result += temp[..<index]
                        
                        temp = name.filter({ char in
                            cons.contains(char.uppercased())
                            })
                        index = temp.index(temp.startIndex, offsetBy: 3)
                        result += temp[..<index]
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yy"
                        result += dateFormatter.string(from: birthDate)
                        dateFormatter.dateFormat = "M"
                        switch dateFormatter.string(from: birthDate) {
                        case "1":
                            result+="A"
                        case "2":
                            result+="B"
                        case "3":
                            result+="C"
                        case "4":
                            result+="D"
                        case "5":
                            result+="E"
                        case "6":
                            result+="H"
                        case "7":
                            result+="L"
                        case "8":
                            result+="M"
                        case "9":
                            result+="P"
                        case "10":
                            result+="R"
                        case "11":
                            result+="S"
                        case "12":
                            result+="T"
                        default:
                            result+=""
                        }
                        if sex == "M" {
                            dateFormatter.dateFormat = "dd"
                            result+=dateFormatter.string(from: birthDate)
                        } else {
                            dateFormatter.dateFormat = "dd"
                            let newDay = (Int(dateFormatter.string(from: birthDate)) ?? 0) + 40
                            result+="\(newDay)"
                        }
                        let code = r.first(where: {$0.split(separator: ";")[0]==birthPlace})?.split(separator: ";")[4]
                        result += "\(code ?? "NULL")"
                        
                        var last = 0
                        /*for index in 0..<result.count {
                            if index % 2 == 0{
                                last += pari[alph.firstIndex(of: Array( result)[index]) ?? 0]
                            } else {
                                last += dispari[alph.firstIndex(of: Array(result)[index]) ?? 0]
                            }
                        }
                        let rest = Double(last) / 26.0
                        result += alph[Int(rest)]*/
                        //does not work the calculus of the last letter of the tax code
                        
                        
                        
                    }
                    
                    
                    
                    
                }) {
                    ZStack{
                          Capsule()
                            .foregroundColor(Color("primary"))
                            .frame(width: width*0.5, height: height*0.07)
                          Text("Calculate")
                              .font(.title2)
                              
                              .foregroundColor(.white)
                      }
                      .padding(.top,height*0.03)
                      
                }

                Spacer()
            }
            .background(Color(UIColor.secondarySystemBackground))
        }
    }
}

struct TaxCodeView_Previews: PreviewProvider {
    static var previews: some View {
        TaxCodeView()
    }
}
