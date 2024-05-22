//
//  TitleView.swift
//  Calculadora EstrelADA
//
//  Created by Lucas Dantas de Moura Carvalho on 10/05/24.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        
        ZStack(alignment: .leading) {
            VStack {
                Text(String(localized: "title_1"))
                    .font(Font.custom("Goldman-Regular", size: 35))
                    .foregroundStyle(Color.white)
                Spacer()
            }
            VStack {
                Spacer()
                ZStack {
                    StrokeText(text: String(localized: "title_2"), width: 2, color: Color.titleBlue)
                        .font(Font.custom("Goldman-Bold", size: 55))
                        .foregroundStyle(Color.titleBlue)
                        .offset(x: 2, y: 2)
                    StrokeText(text: String(localized: "title_2"), width: 2, color: Color.titleBlue)
                        .font(Font.custom("Goldman-Bold", size: 55))
                        .foregroundStyle(LinearGradient(colors: [Color.titleGradient1, Color.titleGradient2, Color.titleGradient3], startPoint: .top, endPoint: .bottom))
                }
            }
        }
        .frame(width: 337, height: 95)
    }
}

struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color

    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}

#Preview {
    TitleView()
}
