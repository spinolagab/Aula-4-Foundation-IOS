//
//  main.swift
//  Desafio 3
//
//  Created by Aluno Mack on 08/07/25.
//

import Foundation

class Square {
    
    // quadrados tem os lados de mesmo tamanho
    var sizeOfL: Int
    
    init(sizeOfL: Int) {
        self.sizeOfL = sizeOfL
    }
    
    func areaSize() -> Int{
        return (self.sizeOfL * self.sizeOfL)
    }
    
}

print("Insira um tamanho para o lado L")

guard let input = readLine() else{
    print("Nil")
    exit(1)
}

guard let L = Int(input) else{
    print("Error: Input is not an Integer value or is a Nil value")
    exit(1)
}

let quadrado: Square = Square(sizeOfL: L)

//init quadrado(Square(sizeOfL: <#T##Int#>))

print(quadrado.areaSize())
