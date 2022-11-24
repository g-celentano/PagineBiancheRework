//
//  UsefulNumbersView.swift
//  PagineBiancheRework
//
//  Created by Gaetano Celentano on 18/11/22.
//

import SwiftUI

struct Cat : Hashable {
    var name : String
    var elements : [String]
    var phoneNumbers : [String]
}


struct UsefulNumbersView: View {
    
    
    @State var showingAlert = false
    
    @State var categories = [
        Cat(name: "Emergencies", elements: [
            "Numero Unico Emergenze",
            "Polizia di Stato",
            "Vigili del Fuoco",
            "Guardia di Finanza",
            "Emergenza Sanitaria",
            "Corpo Forestale",
            "Telefono Azzurro",
            "Capitaneria di Porto",
            "Guardia Forestale",
            "Guardia Medica",
            "Polizia Stradale",
            "Protezione Civile",
            "Questura",
            "Soccorso alpino",
            "Soccorso Stradale",
            "Vigili Urbani"
        ], phoneNumbers: []),
        
        Cat(name: "Services", elements: [
            "Dettatura Telegrammi",
            "Enel Distribuzione",
            "Enel Energia",
            "Enel Rete Gas (segnalazione guasti)",
            "Enel Servizio Elettrico",
            "Enel Sole (segnalazione guasti)",
            "ENI gas & power (clienti domestici)",
            "ENI gas & power (imprese)",
            "ENI italgas (segnalazione guasti)",
            "ENI italgas (autolettura)",
            "INPS (contact center)",
            "Trenitalia (servizio informazioni)",
            "Viabilità Autostrade per l'Italia",
            "Viaggiare informati CCISS"
        ], phoneNumbers: [
            "186",
            "803500",
            "800900860",
            "800900806",
            "800900800",
            "800901050",
            "800900700",
            "800900400",
            "800900999",
            "800999800",
            "803164",
            "892021",
            "840042121",
            "1518",
        ]),
        
        Cat(name: "Phone Operators", elements: [
           "3 H3G - Business",
           "3 H3G - Privati",
           "Acantho",
           "Aria",
           "BT Enìa",
           "BT Italia",
           "CoopVoce",
           "DigiMobil",
           "EhiWeb",
           "ERG Mobile",
           "Fastweb - Business",
           "Fastweb - Commerciale",
           "Fastweb - Privati",
           "Infostrada",
           "Lycamobile",
           "Poste Italiane",
           "Poste Mobile",
           "Telecom Italia - Business",
           "Telecom Italia - Privati",
           "TeleTU",
           "TIM - Business",
           "TIM - Privati",
           "Tiscali - Business",
           "Tiscali - Privati",
           "UNO Mobile",
           "Vodafone",
           "Wind - Business Assistenza",
           "Wind - Business Commerciale",
           "Wind - Privati",
           "ZeroMobile"
        ], phoneNumbers: [
            "139",
            "133",
            "800895000",
            "800242929",
            "800977977",
            "195",
            "188",
            "4077",
            "800911171",
            "401515",
            "192194",
            "192192",
            "192193",
            "155",
            "40322",
            "803160",
            "160",
            "191",
            "187",
            "1922",
            "191",
            "119",
            "192130",
            "130",
            "401001",
            "190",
            "1928",
            "156",
            "155",
            "0292976000"
        ]),
        
        Cat(name: "Health", elements: [
            "ASL",
            "Beauty Farm",
            "Centri Termali",
            "Cliniche private",
            "Croce Rossa",
            "Farmacie",
            "Ospedali",
            "Parafarmacie"
        ], phoneNumbers: []),
        
        Cat(name: "Public Offices", elements: [
            "Ambasciata",
            "Archivio di Stato",
            "Camera di Commercio",
            "Camera del lavoro",
            "Centro Servizi Amministrativi",
            "Cimiteri Nazionali",
            "Municipalità",
            "Consolato",
            "Informa giovani",
            "INAIL",
            "INAS",
            "INPAP",
            "INPS",
            "Ordine dei Dottori Commericialisti",
            "Prefettura",
            "Province",
            "Regioni",
            "Uffici Postali",
            "Ufficio regionale scolastico"
        ], phoneNumbers: []),
    ]
    
    @State var listTapped = -1
    @State var listHeight = [0.0, 0.0, 0.0, 0.0, 0.0]
    @State var listChevsDegrees = [0.0, 0.0, 0.0, 0.0, 0.0]
    @State var phoneNum = ""
    
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .foregroundColor(Color("primary"))
                HStack{
                    Text("Useful Numbers")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .frame(width: width*0.9, alignment: .leading)
                .padding(.top, height*0.11)
                .padding(.bottom, height*0.012)
            }
            .frame(width: width, height: height*0.1)
            .ignoresSafeArea()
            
            // generating the list of categories
            // for each category this code creates the title and the chevron
            ForEach(categories, id: \.self) { cat in
                VStack{
                    HStack{
                        Text(cat.name)
                            .font(.title3)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color("primary"))
                            .rotationEffect(.degrees(listChevsDegrees[categories.firstIndex(of: cat) ?? 0]))
                    }
                    .contentShape(Rectangle())
                    //if clicked, the click is handled to animate the size of every list related to the category title
                    .onTapGesture {
                        if listTapped == categories.firstIndex(of: cat){
                            withAnimation{
                                listHeight[listTapped] = 0.0
                                listChevsDegrees[listTapped] = 0.0
                            }
                            listTapped = -1
                            
                        } else {
                            listTapped = categories.firstIndex(of: cat) ?? -1
                            withAnimation{
                                listHeight.forEach { h in
                                    if listHeight.firstIndex(of: h) != listTapped {
                                        listHeight[listHeight.firstIndex(of: h) ?? 0] = 0.0
                                    }
                                }
                                listChevsDegrees.forEach { d in
                                    if listChevsDegrees.firstIndex(of: d) != listTapped {
                                        listChevsDegrees[listChevsDegrees.firstIndex(of: d) ?? 0] = 0.0
                                    }
                                }
                                listHeight[listTapped] = height * 0.3
                                listChevsDegrees[listTapped] = 90.0
                            }
                            
                        }
                    }
                    //generating a list of options for each category
                    List{
                        ForEach(cat.elements, id: \.self){ el in
                        
                                if cat.phoneNumbers.isEmpty {
                                    NavigationLink(destination: HandleSelection(selected: el ), label: {
                                        Text(el)
                                    })
                                } else {
                                    
                                        HStack{
                                            VStack{
                                                Text(el)
                                                    .frame(width: width * 0.75, alignment:.leading)
                                                Text(cat.phoneNumbers[cat.elements.firstIndex(of: el) ?? 0])
                                                    .font(.caption2)
                                                    .frame(width: width * 0.75, alignment:.leading)
                                            }
                                            Button(action:{
                                                showingAlert=true
                                                phoneNum = cat.phoneNumbers[cat.elements.firstIndex(of: el) ?? 0]
                                            }){
                                                Image(systemName:"phone.connection.fill")
                                                    .foregroundColor(Color("primary"))
                                            }.alert(isPresented: $showingAlert){
                                                Alert(title: Text("Do you want to call \(phoneNum)?"),
                                                      primaryButton: .default(Text("Call")),
                                                      secondaryButton: .cancel(Text("Cancel")))
                                            }
                                        }
                                        
                                   
                                }
                        }
                       
                    }
                    .frame(width: width*0.9, height: listHeight[categories.firstIndex(of: cat) ?? 0])
                    .listStyle(.plain)
                    .cornerRadius(15)
                }
                .padding(.bottom, height*0.01)
                    
            }
            
            .listRowSeparator(.hidden)
            .frame(width: width*0.9)
            Spacer()
           
            
        }
        .background(Color(UIColor.secondarySystemBackground))
        
    }
}

struct UsefulNumbersView_Previews: PreviewProvider {
    static var previews: some View {
        UsefulNumbersView()
    }
}
