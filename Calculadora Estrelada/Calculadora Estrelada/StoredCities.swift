//
//  StoredCitiesPollution.swift
//  Calculadora EstrelADA
//
//  Created by Lucas Dantas de Moura Carvalho on 16/05/24.
//

import Foundation

struct City: Equatable {
    static func == (lhs: City, rhs: City) -> Bool {
        return lhs.name == rhs.name
    }
    
    var name: String
    let bortleClass: Int
    var visibleStars: Int {
        return switch bortleClass {
        case 1: 77627
        case 2: 52080
        case 3: 26533
        case 4: 17650
        case 5: 8768
        case 6: 5795
        case 7: 2822
        case 8: 1858
        case 9: 893
        default: 0
        }
    }
}

let cities: [City] = [
    City(name: "Abreu e Lima", bortleClass: 6),
    City(name: "Araripina", bortleClass: 5),
    City(name: "Arcoverde", bortleClass: 5),
    City(name: "Bezerros", bortleClass: 4),
    City(name: "Belo Jardim", bortleClass: 4),
    City(name: "Buíque", bortleClass: 4),
    City(name: "Cabo de Santo Agostinho", bortleClass: 6),
    City(name: "Camaragibe", bortleClass: 6),
    City(name: "Caruaru", bortleClass: 6),
    City(name: "Carpina", bortleClass: 5),
    City(name: "Escada", bortleClass: 4),
    City(name: "Garanhuns", bortleClass: 5),
    City(name: "Goiana", bortleClass: 5),
    City(name: "Gravatá", bortleClass: 5),
    City(name: "Igarassu", bortleClass: 5),
    City(name: "Ipojuca", bortleClass: 5),
    City(name: "Jaboatão dos Guararapes", bortleClass: 7),
    City(name: "Moreno", bortleClass: 5),
    City(name: "Olinda", bortleClass: 7),
    City(name: "Ouricuri", bortleClass: 4),
    City(name: "Palmares", bortleClass: 4),
    City(name: "Paulista", bortleClass: 7),
    City(name: "Paudalho", bortleClass: 5),
    City(name: "Pesqueira", bortleClass: 4),
    City(name: "Petrolina", bortleClass: 7),
    City(name: "Recife", bortleClass: 8),
    City(name: "Salgueiro", bortleClass: 5),
    City(name: "Santa Cruz do Capibaribe", bortleClass: 5),
    City(name: "São Bento do Una", bortleClass: 4),
    City(name: "São Lourenço da Mata", bortleClass: 6),
    City(name: "Serra Talhada", bortleClass: 5),
    City(name: "Surubim", bortleClass: 5),
    City(name: "Vitória de Santo Antão", bortleClass: 6)
]
