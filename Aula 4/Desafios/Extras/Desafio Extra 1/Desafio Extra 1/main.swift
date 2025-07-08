//
//  main.swift
//  Desafio Extra 1
//
//  Created by Aluno Mack on 08/07/25.
//

import Foundation

class Node{
    var data: Int
    var left: Node?
    var right: Node?
    
    init(data: Int) {
        self.data = data
        self.left = nil
        self.right = nil
    }
    
    
    // Setters
    func setLeft(left: Node){
        self.left = left
    }
    
    func setRight(right: Node){
        self.right = right
    }
    
    
    // Getters
    func getLeft() -> Node? {
        return self.left
    }
    
    func getRight() -> Node? {
        return self.right
    }
    
    func getData() -> Int{
        return self.data
    }
    
}

class BinaryTree{
    var root: Node?
    
    init() {
        self.root = nil
    }
    
    func isTreeEmpty() -> Bool{
        return self.root == nil
    }
    
    func insertNode(node: Node, start: Node){
        if(self.isTreeEmpty()){
            self.root = node
        }
        
        else{
            
            if(node.getData() >= start.getData()){
                if(start.getRight() == nil){
                    start.setRight(right: node)
                }
                else{
                    insertNode(node: node, start: start.getRight())
                }
            }
            
            
            
        }
        
    }
    
}


var teste: Node = Node(data: 4)

var teste2: Node = Node(data: 3)

var teste3: Node = Node(data: 5)

teste.setLeft(left: teste2)

teste.setRight(right: teste3)

print(teste.getData())

if var left = teste.getLeft() {
    print(left.getData())
}

if var right = teste.getRight() {
    print(right.getData())
}

