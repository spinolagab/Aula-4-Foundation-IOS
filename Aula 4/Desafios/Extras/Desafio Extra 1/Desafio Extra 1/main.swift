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
    


    func isLeaf() -> Bool{
        return self.left == nil && self.right == nil
    }


    func getHeight() -> Int{

        if(isLeaf()){
            return 0
        }

        var alturaDireita: Int
        var alturaEsquerda: Int

        if let right = self.getRight() {
            alturaDireita = right.getHeight() + 1
        }
        else {
            alturaDireita = 0
        }
    
        if let left = self.getLeft() {
            alturaEsquerda = left.getHeight() + 1
        }
        else {
            alturaEsquerda = 0
        }

        return max(alturaDireita, alturaEsquerda)

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
    

    func getRoot() -> Node?{
        if let value = self.root {
            return value
        }
        return nil
    }


    func insertNode(node: Node, start: Node){

        if(self.isTreeEmpty()){
            self.root = node
        }
        
        else{
            
            if(node.getData() >= start.getData()){

                if let right = start.getRight(){
                    insertNode(node: node, start: right)
                }
                else{
                    start.setRight(right: node)
                }

            }

            else{
            
                if let left = start.getLeft(){
                    insertNode(node: node, start: left)
                } 
                else{
                    start.setLeft(left: node)
                }
            
            }
            
        }
        
    }


    func getTreeHeight() -> Int{
        guard let root = self.root else {
            return -1
        }

        return root.getHeight()
    }


    func findParent(node: Node) -> Node?{
        if(isTreeEmpty() || self.root === node) {
            return nil
        }

        var start = self.root


        while let aux = start{
            if(aux.getLeft() === node || aux.getRight() === node){
                return aux
            }

            if(node.getData() >= aux.getData()){
                start = aux.getRight() 
            }
            else {
                start = aux.getLeft()
            }
        }

        return nil
    }


    func findMin(node: Node) -> Node?{
        
        var current = node

        while let next = current.getLeft() {
            current = next
        }

        return current
    }


    func findMax(node: Node) -> Node?{

        var current = node

        while let next = current.getRight() {
            current = next
        }

        return current
    }


    func removeNode(root: Node?, value: Int) -> Node? {
        guard let root = root else {
            return nil
        }

        if value < root.data {
            root.left = removeNode(root: root.left, value: value)
        } else if value > root.data {
            root.right = removeNode(root: root.right, value: value)
        } else {

            if root.left == nil {
                return root.right
            }

            if root.right == nil {
                return root.left
            }

            if let min = findMin(node: root.right!) {
                root.data = min.data
                root.right = removeNode(root: root.right, value: min.data)
            }
        }

        return root
    }

    func remove(value: Int){
        self.root = self.removeNode(root: self.root, value: value)
    }

    func inOrderTraversal(node: Node){

        if let left = node.getLeft() {
            inOrderTraversal(node: left)
        }

        print(node.getData())

        if let right = node.getRight(){
            inOrderTraversal(node: right)
        }
        
    }

    func preOrderTraversal(node: Node){

        print(node.getData())

        if let left = node.getLeft() {
            preOrderTraversal(node: left)
        }

        if let right = node.getRight(){
            preOrderTraversal(node: right)
        }       
    }
    
    func postOrderTraversal(node: Node){

        if let left = node.getLeft() {
            postOrderTraversal(node: left)
        }

        if let right = node.getRight(){
            postOrderTraversal(node: right)
        }

        print(node.getData())

    }

}


let tree = BinaryTree()
let n1 = Node(data: 10)
let n2 = Node(data: 5)
let n3 = Node(data: 15)
let n4 = Node(data: 6)
let n5 = Node(data: 12)
let n6 = Node(data: 16)
let n7 = Node(data: 20)
let n8 = Node(data: 7)
let n9 = Node(data: 8)

tree.insertNode(node: n1, start: n1)
tree.insertNode(node: n2, start: n1)
tree.insertNode(node: n3, start: n1)
tree.insertNode(node: n4, start: n1)
tree.insertNode(node: n5, start: n1)
tree.insertNode(node: n6, start: n1)
tree.insertNode(node: n8, start: n1)
tree.insertNode(node: n9, start: n1)


if let root = tree.getRoot() {
    print("In Order Traversal")
    tree.inOrderTraversal(node: root)
    print("Pre Order Traversal")
    tree.preOrderTraversal(node: root)

    print("Post Order Traversal")
    tree.postOrderTraversal(node: root)

    print("Tree Height = \(tree.getTreeHeight())")

    if let direita = root.getRight() {
        if let minimum = tree.findMin(node: direita){
            print("Menor da direita")
            print(minimum.getData())
        }
        
    }

    if let esquerda = root.getLeft(){
        if let maximum = tree.findMax(node: esquerda){
            print("Maior da esquerda")
            print(maximum.getData())
        }
    }

    print("\nRemovendo o 12 que eh uma folha\n")
    
    tree.remove(value: 12)
    tree.inOrderTraversal(node: root)

    print("\nRemovendo o 15 que tem 2 filhos\n")
    
    tree.remove(value: 15)
    tree.inOrderTraversal(node: root)

    print("\nRemovendo o 10 que eh a raiz\n")
    
    tree.remove(value: 10)
    tree.inOrderTraversal(node: root)


    print("Nova raiz: \(tree.getRoot()!.getData())")
    
    
}
