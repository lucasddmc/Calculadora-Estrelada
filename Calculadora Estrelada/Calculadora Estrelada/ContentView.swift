//
//  ContentView.swift
//  Calculadora Estrelada
//
//  Created by Lucas Dantas de Moura Carvalho on 21/05/24.
//

import SwiftUI
import Foundation

enum TimeOperation {
    case add
    case subtract
}

func logC(of value: Double, forBase base: Double) -> Double {
    return log(value) / log(base)
}

func processHour(hourStr: String) -> Double {
    // Extract hour and minute components
    let parts = hourStr.components(separatedBy: ":")
    let hour = Int(parts[0])!
    let minute = Int(parts[1])!
    
    var result: Double = if (18...23).contains(hour) {
        Double(hour) - 18
    } else if (0...4).contains(hour) {
        Double(hour) + 6
    } else {
        0
    }
    
    result += Double(minute) / 60.0
    
    return result
}

func modifyMinutes(_ time: String, by operation: TimeOperation) -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")

    guard let date = dateFormatter.date(from: time) else {
        print("Invalid time format")
        return nil
    }

    let calendar = Calendar.current
    var dateComponents = DateComponents()
    
    switch operation {
    case .add:
        dateComponents.minute = 1
    case .subtract:
        dateComponents.minute = -1
    }

    guard let newDate = calendar.date(byAdding: dateComponents, to: date) else {
        return nil
    }

    return dateFormatter.string(from: newDate)
}

func modifyHour(_ time: String, by operation: TimeOperation) -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")

    guard let date = dateFormatter.date(from: time) else {
        print("Invalid time format")
        return nil
    }

    let calendar = Calendar.current
    var dateComponents = DateComponents()
    
    switch operation {
    case .add:
        dateComponents.hour = 1
    case .subtract:
        dateComponents.hour = -1
    }

    guard let newDate = calendar.date(byAdding: dateComponents, to: date) else {
        return nil
    }

    return dateFormatter.string(from: newDate)
}

struct TextDisplay: View {
    var text: String

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Color.display)
                .frame(width: 300, height: 186)
                .clipShape(.rect(cornerRadius: 20))
            VStack(alignment: .leading) {
                Text(text)
                    .foregroundStyle(Color.displayFont)
                    .font(Font.custom("Minecraft", size: 21))
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                    .kerning(2)
                    .lineSpacing(8)
                    .shadow(color: Color.displayFont, radius: 5)
                    .frame(minHeight: 100)
                Spacer()
            }
            .frame(maxWidth: 300, maxHeight: 186)
        }
    }
}

struct FullDisplay: View {
    var text: String
    @Binding var valueString: String
    var progress: Double
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Color.display)
                .frame(width: 300, height: 186)
                .clipShape(.rect(cornerRadius: 20))
            VStack(alignment: .leading) {
                Text(text)
                    .foregroundStyle(Color.displayFont)
                    .font(Font.custom("Minecraft", size: 21))
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                    .kerning(2)
                    .lineSpacing(8)
                    .shadow(color: Color.displayFont, radius: 5)
                    .frame(minHeight: 100)
                Spacer()
                Text(valueString)
                    .foregroundStyle(Color.displayFont)
                    .shadow(color: Color.displayFont, radius: 5)
                    .font(Font.custom("Minecraft", size: 32))
                    .padding(.leading, 20)
                    .padding(.bottom, 20)
                    .frame(width: 300, alignment: .leading)
                HStack {
                    Spacer()
                    ProgressView(value: progress, total: 20)
                        .progressViewStyle(CustomStyle())
                        .frame(width: 140, height: 9)
                        .frame(alignment: .trailing)
                        .padding(.trailing, 20)
                        .padding(.bottom, 20)
                }
            }
            .frame(maxWidth: 300, maxHeight: 186)
        }
    }
}

struct Calculator0: View {
    @Binding var stateIndex: Int

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.calculatorBackgroundShadow)
                .frame(width: 334, height: 536)
                .clipShape(.rect(cornerRadius: 30))
                .offset(y: 17)
            Rectangle()
                .foregroundStyle(.calculatorBackground)
                .frame(width: 334, height: 536)
                .clipShape(.rect(cornerRadius: 30))
            VStack {
                TextDisplay(text: String(localized: "welcome_text"))
                    .padding(.top, 25)
                Spacer()
                Keyboard0(startButtonAction: {
                    stateIndex += 1
                })
                    .padding(.bottom, 50)
            }
        }
        .frame(width: 334, height: 553)
    }
}

struct Calculator1: View {
    @Binding var stateIndex: Int
    @Binding var ageString: String
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.calculatorBackgroundShadow)
                .frame(width: 334, height: 536)
                .clipShape(.rect(cornerRadius: 30))
                .offset(y: 17)
            Rectangle()
                .foregroundStyle(.calculatorBackground)
                .frame(width: 334, height: 536)
                .clipShape(.rect(cornerRadius: 30))
            VStack {
                FullDisplay(text: String(localized: "age_question"), valueString: $ageString, progress: 0)
                    .padding(.top, 25)
                Spacer()
                Keyboard1(plusOneYearAction: {
                    guard var ageInt = Int(ageString) else {
                        print("erro ao converter ageString para Int, ageString = \(ageString)")
                        return
                    }
                    ageInt += 1
                    ageString = String(ageInt)
                }, minusOneYearAction: {
                    guard var ageInt = Int(ageString) else {
                        print("erro ao converter ageString para Int, ageString = \(ageString)")
                        return
                    }
                    if ageInt > 0 {
                        ageInt -= 1
                        ageString = String(ageInt)
                    }
                }, backButtonAction: {
                    ageString = "0"
                    stateIndex -= 1
                }, nextButtonAction: {
                    stateIndex += 1
                })
                    .padding(.bottom, 50)
            }
        }
        .frame(width: 334, height: 553)
    }
}

struct Calculator2: View {
    @Binding var stateIndex: Int
    @Binding var hourString: String

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.calculatorBackgroundShadow)
                .frame(width: 334, height: 536)
                .clipShape(.rect(cornerRadius: 30))
                .offset(y: 17)
            Rectangle()
                .foregroundStyle(.calculatorBackground)
                .frame(width: 334, height: 536)
                .clipShape(.rect(cornerRadius: 30))
            VStack {
                FullDisplay(text: String(localized: "time_question"), valueString: $hourString, progress: 5)
                    .padding(.top, 25)
                Spacer()
                Keyboard2(plusOneHourAction: {
                    guard let result = modifyHour(hourString, by: .add) else {
                        print("function modifyHour not working")
                        return
                    }
                    hourString = result
                }, plusOneMinuteAction: {
                    guard let result = modifyMinutes(hourString, by: .add) else {
                        print("function modifyMinutes not working")
                        return
                    }
                    hourString = result
                }, minusOneHourAction: {
                    guard let result = modifyHour(hourString, by: .subtract) else {
                        print("function modifyHour not working")
                        return
                    }
                    hourString = result
                }, minusOneMinuteAction: {
                    guard let result = modifyMinutes(hourString, by: .subtract) else {
                        print("function modifyMinutes not working")
                        return
                    }
                    hourString = result
    
                }, backButtonAction: {
                    hourString = "19:00"
                    stateIndex -= 1
                }, nextButtonAction: {
                    stateIndex += 1
                })
                    .padding(.bottom, 50)
            }
        }
        .frame(width: 334, height: 553)
    }
}

struct Calculator3: View {
    @Binding var stateIndex: Int
    @Binding var city: City
    
    func getNextCity(city: City, cities: [City] = cities) -> City? {
        guard let currentIndex = cities.firstIndex(of: city) else {
            return nil
        }
        
        let nextIndex = (currentIndex + 1) % cities.count
        return cities[nextIndex]
    }
    
    func getPreviousCity(city: City, cities: [City] = cities) -> City? {
        guard let currentIndex = cities.firstIndex(of: city) else {
            return nil
        }
        
        let previousIndex = (currentIndex - 1 + cities.count) % cities.count
        return cities[previousIndex]
    }
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.calculatorBackgroundShadow)
                .frame(width: 334, height: 536)
                .clipShape(.rect(cornerRadius: 30))
                .offset(y: 17)
            Rectangle()
                .foregroundStyle(.calculatorBackground)
                .frame(width: 334, height: 536)
                .clipShape(.rect(cornerRadius: 30))
            VStack {
                FullDisplay(text: String(localized: "city_question"), valueString: $city.name, progress: 10)
                    .padding(.top, 25)
                Spacer()
                Keyboard3(nextCityAction: {
                    guard let nextCity = getNextCity(city: city) else {
                        print("error in getNextCity")
                        return
                    }
                    city = nextCity
                }, previousCityAction: {
                    guard let previousCity = getPreviousCity(city: city) else {
                        print("error in getPreviousCity")
                        return
                    }
                    city = previousCity
                }, backButtonAction: {
                    city = cities[0]
                    stateIndex -= 1
                }, nextButtonAction: {
                    stateIndex += 1
                })
                    .padding(.bottom, 50)
            }
        }
        .frame(width: 334, height: 553)
    }
}

struct Calculator4: View {
    @Binding var stateIndex: Int
    @Binding var ageString: String
    @Binding var hourString: String
    @Binding var city: City
    @Binding var starsRateString: String
    @Binding var result: String

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.calculatorBackgroundShadow)
                .frame(width: 334, height: 536)
                .clipShape(.rect(cornerRadius: 30))
                .offset(y: 17)
            Rectangle()
                .foregroundStyle(.calculatorBackground)
                .frame(width: 334, height: 536)
                .clipShape(.rect(cornerRadius: 30))
            VStack {
                FullDisplay(text: String(localized: "rate_question"), valueString: $starsRateString, progress: 15)
                    .padding(.top, 25)
                Spacer()
                Keyboard4(plusOneStarsRateAction: {
                    guard let rate = Int(starsRateString) else {
                        print("starsRate is not convertable to INT, value: \(starsRateString)")
                        return
                    }
                    if rate < 5 {
                        starsRateString = String(rate + 1)
                    }
                }, minusOneStarsRateAction: {
                    guard let rate = Int(starsRateString) else {
                        print("starsRate is not convertable to INT, value: \(starsRateString)")
                        return
                    }
                    if rate > 1 {
                        starsRateString = String(rate - 1)
                    }
                }, backButtonAction: {
                    starsRateString = "0"
                    stateIndex -= 1
                }, finishButtonAction: {
                    var _result = Double(city.visibleStars)
                    let ageDouble = Double(ageString)
                    guard let ageDouble else {
                        print("ageString couldn't be converted to ageDouble, ageString: \(ageString)")
                        return
                    }
                    _result *= logC(of: ageDouble, forBase: 3) / 4.0
                    _result *= logC(of: processHour(hourStr: hourString), forBase: 2) / 3.55
                    
                    guard let rate = Double(starsRateString) else {
                        print("stars rate string couldn't be converted to Double, value: \(starsRateString)")
                        return
                    }
                    _result *= 0.7 + (0.3 * rate / 5)
                    _result *= 0.95 + 0.1 * Double.random(in: 0...1) // 5% para mais ou para menos
                    stateIndex += 1
                    
                    result = String(Int(_result))
                })
                    .padding(.bottom, 50)
            }
        }
        .frame(width: 334, height: 553)
    }
}

struct CalculatorResult: View {
    @Binding var stateIndex: Int
    @Binding var ageString: String
    @Binding var hourString: String
    @Binding var city: City
    @Binding var starsRateString: String
    @Binding var result: String

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.calculatorBackgroundShadow)
                .frame(width: 334, height: 536)
                .clipShape(.rect(cornerRadius: 30))
                .offset(y: 17)
            Rectangle()
                .foregroundStyle(.calculatorBackground)
                .frame(width: 334, height: 536)
                .clipShape(.rect(cornerRadius: 30))
            VStack {
                FullDisplay(text: "Resultado:", valueString: $result, progress: 20)
                    .padding(.top, 25)
                Spacer()
                KeyboardResult(restartButtonAction: {
                    result = "0"
                    ageString = "0"
                    hourString = "19:00"
                    city = cities[0]
                    starsRateString = "0"
                    stateIndex = 0
                }, backButtonAction: {
                    stateIndex -= 1
                    // revert result
                })
                    .padding(.bottom, 50)
            }
        }
        .frame(width: 334, height: 553)
    }
}

struct CalculatorView: View {
    @State var stateIndex: Int = 0
    @State var ageString: String = "0"
    @State var hourString: String = "19:00"
    @State var city: City = cities[0]
    @State var starsRateString: String = "1"
    @State var result: String = "0"

    var body: some View {
        switch stateIndex {
        case 0 : Calculator0(stateIndex: $stateIndex)
        case 1: Calculator1(stateIndex: $stateIndex, ageString: $ageString)
        case 2: Calculator2(stateIndex: $stateIndex, hourString: $hourString)
        case 3: Calculator3(stateIndex: $stateIndex, city: $city)
        case 4: Calculator4(stateIndex: $stateIndex, ageString: $ageString, hourString: $hourString, city: $city, starsRateString: $starsRateString, result: $result)
        case 5: CalculatorResult(stateIndex: $stateIndex, ageString: $ageString, hourString: $hourString, city: $city, starsRateString: $starsRateString, result: $result)
        default: EmptyView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundAnimation()
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30, content: {
                TitleView()
                CalculatorView()
                    .padding(.bottom, 40)
            })
        }
    }
}

#Preview("Content") {
    ContentView()
}

#Preview("textdisplay") {
    TextDisplay(text: String(localized: "welcome_text"))
}

#Preview("fulldisplay") {
    FullDisplay(text: String(localized: "age_question"), valueString: .constant("0"), progress: 5)
}

#Preview("calculator0") {
    Calculator0(stateIndex: .constant(0))
}

#Preview("calculator2") {
    Calculator2(stateIndex: .constant(2), hourString: .constant("19:00"))
}
