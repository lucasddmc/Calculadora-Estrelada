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
