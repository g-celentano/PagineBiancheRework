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
    
    @State var selected = 1
    @FocusState var focusedFields : Bool
    @State var firstValuePerson = ""
    @State var secondValuePerson = ""
    @State var phoneValue = ""
    @State var addressValue = ""
    @State var buttonTapped = false
    @State var imageInfo = [
        ImageInfo(scale: width*0.0055, color: .white),
        ImageInfo(scale: width*0.004 , color: Color("iconBG")),
        ImageInfo(scale: width*0.004 , color: Color("iconBG"))
    ]
    
    @Binding var h : CGFloat
    
    
    var body: some View {
        
        ScrollViewReader{ reader in
            VStack{
                HStack{
                    Text("Search Information")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    Button(action:{
                        withAnimation {
                            h = 0.0
                        }
                        
                    }){
                        Image(systemName: "chevron.down")
                            .scaleEffect(width*0.004)
                            .foregroundColor(Color("iconBG"))
                    }
                }
                .frame(width: width*0.9, alignment: .leading)
                .padding(.bottom, height*0.03)
                
                HStack{
                    Button{
                        
                        withAnimation(.linear(duration: 0.1)){
                            reader.scrollTo(1)
                            selected = 1
                            
                            imageInfo[0].color = .white
                            imageInfo[1].color = Color("iconBG")
                            imageInfo[2].color = Color("iconBG")
                            
                            imageInfo[0].scale = width*0.0055
                            imageInfo[1].scale = width*0.004
                            imageInfo[2].scale = width*0.004
                            
                            
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
                            selected = 2
                            
                            imageInfo[0].color = Color("iconBG")
                            imageInfo[1].color = .white
                            imageInfo[2].color = Color("iconBG")
                            
                            imageInfo[0].scale = width*0.004
                            imageInfo[1].scale = width*0.0055
                            imageInfo[2].scale = width*0.004
                            
                            
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
                            selected = 3
                            
                            imageInfo[0].color = Color("iconBG")
                            imageInfo[1].color = Color("iconBG")
                            imageInfo[2].color = .white
                            
                            imageInfo[0].scale = width*0.004
                            imageInfo[1].scale = width*0.004
                            imageInfo[2].scale = width*0.0055
                            
                            
                        }
                    }label: {
                        Image(systemName: "location.circle.fill")
                            .foregroundColor(imageInfo[2].color)
                            .scaleEffect(imageInfo[2].scale)
                    }
                    
                }
                .frame(width: width*0.8)
                
                
                
                ScrollView(.horizontal){
                    HStack{
                        //------------------------- text fields 1
                        VStack{
                            HStack{
                                ZStack{
                                    Text(firstValuePerson.isEmpty ? "Name and Surname, or Company" : "")
                                        .foregroundColor(.white.opacity(0.4))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    TextField("", text: $firstValuePerson)
                                        .foregroundColor(.white)
                                        
                                }
                                    
                                Spacer()
                                Button(action: {
                                    firstValuePerson = ""
                                }){
                                    Image(systemName: "x.circle.fill")
                                        .foregroundColor(Color("iconBG"))
                                        .frame(width: width*0.1)
                                    
                                }
                                .opacity(firstValuePerson == "" ? 0.0 : 1.0)
                                
                                
                            }
                            .frame(width: width*0.9)
                            .padding(.bottom, height*0.003)
                            
                            Rectangle()
                                .frame(width: width*0.9, height: height * 0.0007)
                                .padding(.bottom, height*0.03)
                                .foregroundColor(.white)
                            
                            HStack{
                                ZStack{
                                    Text(secondValuePerson.isEmpty ? "City, street and number" : "")
                                        .foregroundColor(.white.opacity(0.4))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    TextField("", text: $secondValuePerson)
                                        .foregroundColor(.white)
                                        
                                }
                                
                                    
                                Spacer()
                                Button(action: {
                                    secondValuePerson = ""
                                }){
                                    Image(systemName: "x.circle.fill")
                                        .foregroundColor(Color("iconBG"))
                                        .frame(width: width*0.1)
                                    
                                }
                                .opacity(secondValuePerson == "" ? 0.0 : 1.0)
                                
                                
                            }
                            .frame(width: width*0.9)
                            .padding(.bottom, height*0.003)
                            
                            Rectangle()
                                .frame(width: width*0.9, height: height * 0.0005)
                                .foregroundColor(.white)
                            
                        }
                        //.opacity(selected == 1 ? 1.0 : 0.0)
                        .padding(.trailing, width*0.05)
                        .padding(.leading, width*0.05)
                        .id(1)
                        
                        //------------------------- text fields 2
                        VStack{
                            HStack{
                                ZStack{
                                    Text(phoneValue.isEmpty ? "Phone Number e.g. 0114351" : "")
                                        .foregroundColor(.white.opacity(0.4))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    TextField("", text: $phoneValue)
                                        .foregroundColor(.white)
                                        
                                }
                                
                                Spacer()
                                Button(action: {
                                    phoneValue = ""
                                }){
                                    Image(systemName: "x.circle.fill")
                                        .foregroundColor(Color("iconBG"))
                                        .frame(width: width*0.1)
                                    
                                }
                                .opacity(phoneValue == "" ? 0.0 : 1.0)
                                
                                
                            }
                            .frame(width: width*0.9)
                            .padding(.bottom, height*0.003)
                            
                            Rectangle()
                                .frame(width: width*0.9, height: height * 0.0005)
                                .foregroundColor(.white)
                            
                        }
                        // .opacity(selected == 2 ? 1.0 : 0.0)
                        .padding(.trailing, width*0.05)
                        .padding(.leading, width*0.05)
                        .id(2)
                        
                        //------------------------- text fields 3
                        VStack{
                            HStack{
                                ZStack{
                                    Text(addressValue.isEmpty ? "Address e.g. Torino via Garibaldi" : "")
                                        .foregroundColor(.white.opacity(0.4))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    TextField("", text: $addressValue)
                                        .foregroundColor(.white)
                                        
                                }
                                
                            
                                Spacer()
                                Button(action: {
                                    addressValue = ""
                                }){
                                    Image(systemName: "x.circle.fill")
                                        .foregroundColor(Color("iconBG"))
                                        .frame(width: width*0.1)
                                    
                                }
                                .opacity(addressValue == "" ? 0.0 : 1.0)
                                
                                
                            }
                            .frame(width: width*0.9)
                            .padding(.bottom, height*0.003)
                            
                            Rectangle()
                                .frame(width: width*0.9, height: height * 0.0005)
                                .foregroundColor(.white)
                            
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
            
            NavigationLink(destination: HandleSelection(
                selected:  selected == 1 ? firstValuePerson : selected == 2 ? phoneValue : selected == 3 ? addressValue : "",
                location: selected == 1 ? secondValuePerson : "",
                defaultSearch: false)) {
                
                    ZStack{
                        
                            Capsule()
                            .foregroundColor(.white)
                            .frame(width: width*0.4, height: height*0.05)
                            
                        
                            /*Capsule()
                            .stroke(Color.white, lineWidth: 4)
                            .foregroundColor(.clear)
                            .frame(width: width*0.4, height: height*0.05)*/
                        
                          Text("Search")
                              .font(.title2)
                              .fontWeight(.semibold)
                              .foregroundColor(Color("primary"))
                      }
                      .frame(width: width * 0.4 , height: height*0.1)
                      .padding(.top,height*0.03)
                      
                     
                      
                }
                .disabled(selected == 1 ? firstValuePerson.isEmpty && secondValuePerson.isEmpty :
                          selected == 2 ? phoneValue.isEmpty :
                          selected == 3 ? addressValue.isEmpty : false)
                
                .padding(.bottom, height * 0.05)
                
            

        }
        .frame(width: width, height: height * 0.5)
        .background(Color("primary"))
        .padding(.bottom, 15)
        .cornerRadius(15)
        .edgesIgnoringSafeArea(.bottom)
        
        
    }
}
    


struct SearchModal_Previews: PreviewProvider {
    static var previews: some View {
        SearchModal(h: .constant(0))
    }
}

