//
//  main.swift
//  Desafio 2
//
//  Created by Aluno Mack on 08/07/25.
//

import Foundation

let pi: Double = 3.1415

class Circle{
    var radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func getArea() -> Double{
        return (pi * pow(self.radius, 2))
    }
    
    func getPerimeter() -> Double{
        return (2 * pi * self.radius)
    }
}

print("Insira um valor para o raio (R) do circulo")

guard let input = readLine() else{
    print("Nil")
    exit(1)
}

guard let R = Double(input) else{
    print("Error: Input is not a Double/Integer value or is a Nil value")
    exit(1)
}

let circulo: Circle = Circle(radius: R)

print(circulo.getArea())

print(circulo.getPerimeter())
