//
//  main.swift
//  Desafio 1
//
//  Created by Aluno Mack on 08/07/25.
//

import Foundation

class Piramid{
    var baseLine: Double
    var height: Double
    
    init(baseLine: Double, height: Double) {
        self.baseLine = baseLine
        self.height = height
    }
    
    func getVolume() -> Double{
        return ((pow(self.baseLine, 2) * self.height) / 3)
    }
    
    func getSurfaceArea() -> Double{
        let triangleHeight = sqrt(pow(self.height, 2) + pow((self.baseLine / 2), 2))
        let triangleArea = (self.baseLine * triangleHeight) / 2
        return pow(baseLine, 2) + (4 * triangleArea)
    }
    
}


print("Insira o tamanho do lado do quadrado para a base")

guard var input = readLine() else{
    print("Nil")
    exit(1)
}

guard let base = Double(input) else{
    print("Error: Input is not a Double/Integer value or is a Nil value")
    exit(1)
}



print("Insira o tamanho da altura da piramide")

guard var input = readLine() else{
    print("Nil")
    exit(1)
}

guard let altura = Double(input) else{
    print("Error: Input is not a Double/Integer value or is a Nil value")
    exit(1)
}

let piramide: Piramid = Piramid(baseLine: base, height: altura)


print(piramide.getSurfaceArea())

print(piramide.getVolume())
