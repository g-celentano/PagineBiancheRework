//
//  PostOffices.swift
//  PagineBiancheRework
//
//  Created by Gaetano Celentano on 18/11/22.
//

import SwiftUI

struct SearchResultView: View {
    @State var selectedPage : String
    
    var body: some View {
        Text(selectedPage)
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(selectedPage: "")
    }
}
