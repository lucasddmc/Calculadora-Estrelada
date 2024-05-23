//
//  KeyboardButton.swift
//  Calculadora Estrelada
//
//  Created by Lucas Dantas de Moura Carvalho on 23/05/24.
//

import SwiftUI

import SwiftUI
import AVFoundation

struct KeyboardButton: View {
//    var imageName: String
    var imageName: String
    var isBigButton: Bool = false
    var action: (() -> ())?
    @State var isPressed: Bool = false
//    @State var didLongPress: Bool = false
    @State private var task: Task<Void, Never>?
    @State private var audioPlayer: AVAudioPlayer!
    
    var clickable: Bool {
        return imageName != "defaultButton"
    }
    
    static var defaultButton: KeyboardButton = KeyboardButton(
        imageName: "defaultButton"
    )
    
    static func next(action: @escaping () -> Void = {}) -> KeyboardButton {
        KeyboardButton(imageName: "next",
        isBigButton: true,
        action: action)
    }
    
    static func start(action: @escaping () -> Void = {}) -> KeyboardButton {
        KeyboardButton(imageName: "start",
        isBigButton: true,
        action: action)
    }
    
    static func finish(action: @escaping () -> Void = {}) -> KeyboardButton {
        KeyboardButton(imageName: "finish",
        isBigButton: true,
        action: action)
    }
    
    static func restart(action: @escaping () -> Void = {}) -> KeyboardButton {
        KeyboardButton(imageName: "restart",
        isBigButton: true,
        action: action)
    }
    
    static func back(action: @escaping () -> Void = {}) -> KeyboardButton {
        KeyboardButton(imageName: "back",
        action: action)
    }
    
    static func plusOneYear(action: @escaping () -> Void = {}) -> KeyboardButton {
        KeyboardButton(imageName: "plusOneYear",
        action: action)
    }
    
    static func minusOneYear(action: @escaping () -> Void = {}) -> KeyboardButton {
        KeyboardButton(imageName: "minusOneYear",
        action: action)
    }
    
    static func plusOneHour(action: @escaping () -> Void = {}) -> KeyboardButton {
        KeyboardButton(imageName: "plusOneHour",
        action: action)
    }
    
    static func minusOneHour(action: @escaping () -> Void = {}) -> KeyboardButton {
        KeyboardButton(imageName: "minusOneHour",
        action: action)
    }
    
    static func plusOneMinute(action: @escaping () -> Void = {}) -> KeyboardButton {
        KeyboardButton(imageName: "plusOneMinute",
        action: action)
    }
    
    static func minusOneMinute(action: @escaping () -> Void = {}) -> KeyboardButton {
        KeyboardButton(imageName: "minusOneMinute",
        action: action)
    }
    
    static func previousCity(action: @escaping () -> Void = {}) -> KeyboardButton {
        KeyboardButton(imageName: "previousCity",
        action: action)
    }
    
    static func nextCity(action: @escaping () -> Void = {}) -> KeyboardButton {
        KeyboardButton(imageName: "nextCity",
        action: action)
    }
    
    static func plusOneSkyRate(action: @escaping () -> Void = {}) -> KeyboardButton {
        KeyboardButton(imageName: "plusOneSkyRate",
        action: action)
    }
    
    static func minusOneSkyRate(action: @escaping () -> Void = {}) -> KeyboardButton {
        KeyboardButton(imageName: "minusOneSkyRate",
        action: action)
    }

    var body: some View {
        Button {
            isPressed = false

//            if let _ = action {
//                guard let soundFile = NSDataAsset(name: "trimmedTap") else {
//                    print("🚨")
//                    return
//                }
//                do {
//                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
//                    audioPlayer.play()
//                } catch {
//                    print("🚨")
//                }
//            }
//            task = Task(priority: .background) {
//                do {
//                    try await Task.sleep(for: .milliseconds(50))
//                    await MainActor.run {
//                        isPressed = false
//                    }
//                } catch {
//                    print(error)
//                }
//            }
//            if let action {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                    action()
//                }
//            }
        } label: {
            if !isBigButton {
                Image(isPressed ? imageName + "Pressed" : imageName)
                    .resizable()
                    .frame(width: 87, height: 77)
            } else {
                Image(isPressed ? imageName + "Pressed" : imageName)
                    .resizable()
                    .frame(width: 194, height: 77)
            }
        }
        .disabled(!clickable)
        .buttonStyle(NoTapAnimationStyle())
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    self.isPressed = true
                }
                .onEnded { _ in
                    if isPressed {
                        if let _ = action {
                            guard let soundFile = NSDataAsset(name: "trimmedTap") else {
                                print("🚨")
                                return
                            }
                            do {
                                audioPlayer = try AVAudioPlayer(data: soundFile.data)
                                audioPlayer.play()
                            } catch {
                                print("🚨")
                            }
                        }
                    }
                    
                    if let action {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            action()
                        }
                    }
                    self.isPressed = false
                }
        )
    }
    func onTouchDown() {
        if let _ = action {
            guard let soundFile = NSDataAsset(name: "trimmedTap") else {
                print("🚨")
                return
            }
            do {
                audioPlayer = try AVAudioPlayer(data: soundFile.data)
                audioPlayer.play()
            } catch {
                print("🚨")
            }
        }
        task = Task(priority: .background) {
            do {
                try await Task.sleep(for: .milliseconds(50))
                await MainActor.run {
                    isPressed = false
                }
            } catch {
                print(error)
            }
        }
        if let action {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                action()
            }
        }
    }
    
    func onTouchUp() {
        
    }
    
}


struct NoTapAnimationStyle: PrimitiveButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .onTapGesture(perform: configuration.trigger)
    }
}
