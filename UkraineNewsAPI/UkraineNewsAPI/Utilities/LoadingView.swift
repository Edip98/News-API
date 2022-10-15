//
//  LoadingView.swift
//  UkraineNewsAPI
//
//  Created by Эдип on 14.10.2022.
//

import SwiftUI

struct LoadingView: View {
    
    var alingment: Alignment
    
    var body: some View {
        ZStack(alignment: alingment) {
            
            Color(uiColor: .systemBackground)
                .ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .yellow))
                .scaleEffect(2)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(alingment: .center)
    }
}
