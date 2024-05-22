//
//  ProgressViewStyle.swift
//  Calculadora Estrelada
//
//  Created by Lucas Dantas de Moura Carvalho on 21/05/24.
//

import SwiftUI

struct CustomStyle: ProgressViewStyle {
    var strokeColor = Color.displayFont
    
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        
        return ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.black.opacity(0))
                .frame(width: 140, height: 9)
                .border(Color.displayFont, width: 2)
                .shadow(color: Color.displayFont, radius: 5)
            Rectangle()
                .frame(width: 140 * fractionCompleted)
                .foregroundColor(Color.displayFont)
                .shadow(color: Color.displayFont, radius: 5)
        }
    }
}


#Preview {
    ProgressView()
        .progressViewStyle(CustomStyle())
}
