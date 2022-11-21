//
//  HandleSelection.swift
//  PagineBiancheRework
//
//  Created by Gaetano Celentano on 17/11/22.
//

import SwiftUI

var NotSearchResult = [
    "Calculate Tax Code",
    "Find Zip Code",
    "National Prefix",
    "International Prefix",
    "Procedures and Documents"
]

struct HandleSelection: View {
    var selected : String
    
    
    var body: some View {
        ZStack{
            SearchResultView(selectedPage: selected)
                .opacity(NotSearchResult.contains(selected) ? 0.0 : 1.0)
            TaxCodeView()
                .opacity(selected == "Calculate Tax Code" ? 1.0 : 0.0)
            ZipCodeView()
                .opacity(selected == "Find Zip Code" ? 1.0 : 0.0)
            NationalPrefixView()
                .opacity(selected == "National Prefix" ? 1.0 : 0.0)
            InternationalPrefixView()
                .opacity(selected == "Interational Prefix" ? 1.0 : 0.0)
            ProceduresView()
                .opacity(selected == "Procedures and Documents" ? 1.0 : 0.0)
        }
    }
}

struct HandleSelection_Previews: PreviewProvider {
    static var previews: some View {
        HandleSelection(selected: "")
    }
}
