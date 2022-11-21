//
//  SearchModal.swift
//  PagineBiancheRework
//
//  Created by Gaetano Celentano on 16/11/22.
//

import SwiftUI

struct ImageInfo {
    var scale : Double
    var color : Color
}

struct SearchModal: View {
    
    @State var firstValuePerson = ""
    @State var secondValuePerson = ""
    @State var phoneValue = ""
    @State var addressValue = ""
    @State var imageInfo = [
        ImageInfo(scale: width*0.0055, color: Color("mainColor")),
        ImageInfo(scale: width*0.004, color: Color("unselectedColor")),
        ImageInfo(scale: width*0.004, color: Color("unselectedColor"))
    ]
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollViewReader{ reader in
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
                        
                        withAnimation(.linear(duration: 0.1)){
                            reader.scrollTo(1)
                            
                            imageInfo[0].scale = width*0.0055
                            imageInfo[1].scale = width*0.004
                            imageInfo[2].scale = width*0.004
                            
                            imageInfo[0].color = Color("mainColor")
                            imageInfo[1].color = Color("unselectedColor")
                            imageInfo[2].color = Color("unselectedColor")
                        }
                    }label: {
                        Image(systemName: "person.fill")
                            .foregroundColor(imageInfo[0].color)
                            .scaleEffect(imageInfo[0].scale)
                    }
                   
                    Spacer()
                    Button{
                        
                        withAnimation(.linear(duration: 0.1)){
                            reader.scrollTo(2)
                            
                            imageInfo[0].scale = width*0.004
                            imageInfo[1].scale = width*0.0055
                            imageInfo[2].scale = width*0.004
                            
                            imageInfo[0].color = Color("unselectedColor")
                            imageInfo[1].color = Color("mainColor")
                            imageInfo[2].color = Color("unselectedColor")
                        }
                    }label: {
                        Image(systemName: "phone.fill")
                            .foregroundColor(imageInfo[1].color)
                            .scaleEffect(imageInfo[1].scale)
                    }
                   
                    
                    Spacer()
                    Button{
                       
                        withAnimation(.linear(duration: 0.1)){
                            reader.scrollTo(3)
                            
                            imageInfo[0].scale = width*0.004
                            imageInfo[1].scale = width*0.004
                            imageInfo[2].scale = width*0.0055
                            
                            imageInfo[0].color = Color("unselectedColor")
                            imageInfo[1].color = Color("unselectedColor")
                            imageInfo[2].color = Color("mainColor")
                        }
                    }label: {
                        Image(systemName: "location.circle.fill")
                            .foregroundColor(imageInfo[2].color)
                            .scaleEffect(imageInfo[2].scale)
                    }
                    
                }
                .frame(width: width*0.8)
                .padding(.top)
                
                
                
                    ScrollView(.horizontal){
                        HStack{
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
                            //.opacity(selected == 1 ? 1.0 : 0.0)
                            .padding(.trailing, width*0.05)
                            .padding(.leading, width*0.05)
                            .id(1)

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
                           // .opacity(selected == 2 ? 1.0 : 0.0)
                            .padding(.trailing, width*0.05)
                            .padding(.leading, width*0.05)
                            .id(2)
                            
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
                            .padding(.trailing, width*0.05)
                            .padding(.leading, width*0.05)
                            .id(3)
                           // .opacity(selected == 3 ? 1.0 : 0.0)
                        }
                        
                }
                .padding(.top, height*0.04)
                .frame(alignment: .top)
                .scrollDisabled(true)
                
        }
            
            
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
