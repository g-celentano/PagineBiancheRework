//
//  SearchModal.swift
//  PagineBiancheRework
//
//  Created by Gaetano Celentano on 16/11/22.
//

import SwiftUI

struct SearchModal: View {
    @State var selected = 1
    @State var firstValuePerson = ""
    @State var secondValuePerson = ""
    @State var phoneValue = ""
    @State var addressValue = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            HStack{
                Text("Search Information")
                    .font(.title)
                    .fontWeight(.bold)
                    
                Spacer()
                Button(action:{
                    presentationMode.wrappedValue.dismiss()
                }){
                    Image(systemName: "chevron.down")
                        .scaleEffect(width*0.004)
                        .foregroundColor(Color("mainColor"))
                }
            }
            .frame(width: width*0.9, alignment: .leading)
                
            HStack{
                Button{
                    selected = 1
                }label: {
                    Image(systemName: "person.fill")
                        .foregroundColor(selected == 1 ? Color("mainColor"): Color("unselectedColor"))
                        .scaleEffect(width*0.004)
                }
                
                Spacer()
                Button{
                    selected = 2
                }label: {
                    Image(systemName: "phone.fill")
                        .foregroundColor(selected == 2 ? Color("mainColor"): Color("unselectedColor"))
                        .scaleEffect(width*0.004)
                }
                
                Spacer()
                Button{
                    selected = 3
                }label: {
                    Image(systemName: "location.circle.fill")
                        .foregroundColor(selected == 3 ? Color("mainColor"): Color("unselectedColor"))
                        .scaleEffect(width*0.004)
                }
            }
            .frame(width: width*0.8)
            .padding(.top)
            
            
            ZStack{
                //------------------------- text fields 1
                VStack{
                    HStack{
                        TextField("Name and Surname, or Company", text: $firstValuePerson)
                        Spacer()
                        Button(action: {
                            firstValuePerson = ""
                        }){
                            Image(systemName: "x.circle.fill")
                                .foregroundColor(Color("unselectedColor"))
                                .frame(width: width*0.1)
                            
                        }
                        .opacity(firstValuePerson == "" ? 0.0 : 1.0)
                        
                            
                    }
                    .frame(width: width*0.9)
                    .padding(.bottom, height*0.003)
                        
                    Divider()
                        .frame(width: width*0.9)
                        .padding(.bottom, height*0.03)
                    
                    HStack{
                        TextField("City, street and number", text: $secondValuePerson)
                        Spacer()
                        Button(action: {
                            secondValuePerson = ""
                        }){
                            Image(systemName: "x.circle.fill")
                                .foregroundColor(Color("unselectedColor"))
                                .frame(width: width*0.1)
                            
                        }
                        .opacity(secondValuePerson == "" ? 0.0 : 1.0)
                        
                            
                    }
                    .frame(width: width*0.9)
                    .padding(.bottom, height*0.003)
                        
                    Divider()
                        .frame(width: width*0.9)
                    
                }
                .opacity(selected == 1 ? 1.0 : 0.0)
                .frame(alignment: .top)

                //------------------------- text fields 2
                VStack{
                    HStack{
                        TextField("Phone Number e.g. 0114351", text: $phoneValue)
                        Spacer()
                        Button(action: {
                            phoneValue = ""
                        }){
                            Image(systemName: "x.circle.fill")
                                .foregroundColor(Color("unselectedColor"))
                                .frame(width: width*0.1)
                            
                        }
                        .opacity(phoneValue == "" ? 0.0 : 1.0)
                        
                            
                    }
                    .frame(width: width*0.9)
                    .padding(.bottom, height*0.003)
                        
                    Divider()
                        .frame(width: width*0.9)
                        .padding(.bottom, height*0.03)
                   
                }
                .opacity(selected == 2 ? 1.0 : 0.0)
                .frame(alignment: .top)
                
                //------------------------- text fields 3
                VStack{
                    HStack{
                        TextField("Address e.g. Torino via Garibaldi", text: $addressValue)
                        Spacer()
                        Button(action: {
                            addressValue = ""
                        }){
                            Image(systemName: "x.circle.fill")
                                .foregroundColor(Color("unselectedColor"))
                                .frame(width: width*0.1)
                            
                        }
                        .opacity(phoneValue == "" ? 0.0 : 1.0)
                        
                            
                    }
                    .frame(width: width*0.9)
                    .padding(.bottom, height*0.003)
                        
                    Divider()
                        .frame(width: width*0.9)
                        .padding(.bottom, height*0.03)
                   
                }
                .opacity(selected == 3 ? 1.0 : 0.0)
            }
            .padding(.top, height*0.03)
            .frame(alignment: .top)
            
            
            
            Button(action:{
                
                
                presentationMode.wrappedValue.dismiss()
            }){
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color("buttonColor"))
                    Text("Search")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .frame(width:width*0.95, height: height*0.07)
            }
            .padding(.top, height*0.1)

            
            
        }
        .frame(width: width, height: height)
        .background(Color("bg"))
        
    }
}

struct SearchModal_Previews: PreviewProvider {
    static var previews: some View {
        SearchModal()
    }
}
