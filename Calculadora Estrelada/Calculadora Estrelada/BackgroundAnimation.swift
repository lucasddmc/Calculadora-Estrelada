//
//  StarsBackgroundView.swift
//  Calculadora EstrelADA
//
//  Created by Lucas Dantas de Moura Carvalho on 10/05/24.
//

import SwiftUI

struct BackgroundAnimation: View {
    
    let animationDuration = 0.1 // Duração em segundos de cada imagem
    
    @State private var currentIndex = 0
    @State private var task: Task<Void, Never>?
    
    var body: some View {
        Image("frame_\(currentIndex)")
            .resizable()
            .scaledToFill()
            .onAppear {
                startAnimation()
            }
            .onDisappear {
                stopAnimation()
            }
    }
    
    func startAnimation() {
        task = Task(priority: .background) {
            do {
                try await Task.sleep(for: .milliseconds(100))
                await MainActor.run {
                    currentIndex = (currentIndex + 1) % 8
                }
                startAnimation()
            } catch {
                print(error)
            }
        }
    }
    
    func stopAnimation() {
        task = nil
    }
}

#Preview {
    BackgroundAnimation()
}
