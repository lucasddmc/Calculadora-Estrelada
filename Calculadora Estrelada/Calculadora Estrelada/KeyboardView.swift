//
//  KeyboardView.swift
//  Calculadora Estrelada
//
//  Created by Lucas Dantas de Moura Carvalho on 21/05/24.
//

import SwiftUI

struct Keyboard0: View {
    var startButtonAction: () -> ()
    var body: some View {
        VStack(spacing: 22) {
            HStack(spacing: 20) {
                ForEach(0..<3) { _ in
                    KeyboardButton.defaultButton
                }
            }
            HStack(spacing: 20) {
                ForEach(0..<3) { _ in
                    KeyboardButton.defaultButton
                }
            }
            HStack(spacing: 20) {
                KeyboardButton.defaultButton
                KeyboardButton.start(action: startButtonAction)
            }
        }
    }
}

struct Keyboard1: View {
    var plusOneYearAction: () -> ()
    var minusOneYearAction: () -> ()
    var backButtonAction: () -> ()
    var nextButtonAction: () -> ()
    
    var body: some View {
        VStack(spacing: 22) {
            HStack(spacing: 20) {
                KeyboardButton.defaultButton
                KeyboardButton.plusOneYear(action: plusOneYearAction)
                KeyboardButton.defaultButton
            }
            HStack(spacing: 20) {
                KeyboardButton.defaultButton
                KeyboardButton.minusOneYear(action: minusOneYearAction)
                KeyboardButton.defaultButton
            }
            HStack(spacing: 20) {
                KeyboardButton.back(action: backButtonAction)
                KeyboardButton.next(action: nextButtonAction)
            }
        }
    }
}

struct Keyboard2: View {
    let plusOneHourAction: () -> ()
    let plusOneMinuteAction: () -> ()
    let minusOneHourAction: () -> ()
    let minusOneMinuteAction: () -> ()
    let backButtonAction: () -> ()
    let nextButtonAction: () -> ()
    
    var body: some View {
        VStack(spacing: 22) {
            HStack(spacing: 20) {
                KeyboardButton.plusOneHour(action: plusOneHourAction)
                KeyboardButton.plusOneMinute(action: plusOneMinuteAction)
                KeyboardButton.defaultButton
            }
            HStack(spacing: 20) {
                KeyboardButton.minusOneHour(action: minusOneHourAction)
                KeyboardButton.minusOneMinute(action: minusOneMinuteAction)
                KeyboardButton.defaultButton
            }
            HStack(spacing: 20) {
                KeyboardButton.back(action: backButtonAction)
                KeyboardButton.next(action: nextButtonAction)
            }
        }
    }
}

struct Keyboard3: View {
    var nextCityAction: () -> ()
    var previousCityAction: () -> ()
    var backButtonAction: () -> ()
    var nextButtonAction: () -> ()
    
    var body: some View {
        VStack(spacing: 22) {
            HStack(spacing: 20) {
                KeyboardButton.previousCity(action: previousCityAction)
                KeyboardButton.nextCity(action: nextCityAction)
                KeyboardButton.defaultButton
            }
            HStack(spacing: 20) {
                KeyboardButton.defaultButton
                KeyboardButton.defaultButton
                KeyboardButton.defaultButton
            }
            HStack(spacing: 20) {
                KeyboardButton.back(action: backButtonAction)
                KeyboardButton.next(action: nextButtonAction)
            }
        }
    }
}

struct Keyboard4: View {
    var plusOneStarsRateAction: () -> ()
    var minusOneStarsRateAction: () -> ()
    var backButtonAction: () -> ()
    var finishButtonAction: () -> ()
    
    var body: some View {
        VStack(spacing: 22) {
            HStack(spacing: 20) {
                KeyboardButton.defaultButton
                KeyboardButton.plusOneYear(action: plusOneStarsRateAction)
                KeyboardButton.defaultButton
            }
            HStack(spacing: 20) {
                KeyboardButton.defaultButton
                KeyboardButton.minusOneYear(action: minusOneStarsRateAction)
                KeyboardButton.defaultButton
            }
            HStack(spacing: 20) {
                KeyboardButton.back(action: backButtonAction)
                KeyboardButton.finish(action: finishButtonAction)
            }
        }
    }
}

struct KeyboardResult: View {
    let restartButtonAction: () -> ()
    let backButtonAction: () -> ()
    
    var body: some View {
        VStack(spacing: 22) {
            HStack(spacing: 20) {
                KeyboardButton.defaultButton
                KeyboardButton.defaultButton
                KeyboardButton.defaultButton
            }
            HStack(spacing: 20) {
                KeyboardButton.defaultButton
                KeyboardButton.defaultButton
                KeyboardButton.defaultButton
            }
            HStack(spacing: 20) {
                KeyboardButton.back(action: backButtonAction)
                KeyboardButton.restart(action: restartButtonAction)
            }
        }
    }
}

struct KeyboardButton: View {
//    var imageName: String
    var imageName: String
    var isBigButton: Bool = false
    var action: (() -> ())?
    @State var isPressed: Bool = false
//    @State var didLongPress: Bool = false
    @State private var task: Task<Void, Never>?
    
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
            isPressed = true
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
//        .simultaneousGesture(LongPressGesture().onEnded { _ in
//            didLongPress = true
//            isPressed = false
//        })
//        .simultaneousGesture(TapGesture().onEnded {
//            didLongPress = false
//        })
        .disabled(!clickable)
        .buttonStyle(NoTapAnimationStyle())
    }
    
}

struct NoTapAnimationStyle: PrimitiveButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .onTapGesture(perform: configuration.trigger)
    }
}


//#Preview {
//    KeyboardView(statesIndex: .constant(0))
//}
