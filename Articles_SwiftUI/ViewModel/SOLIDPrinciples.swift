//
//  Shape.swift
//  Articles_SwiftUI
//
//  Created by Mandar Kadam on 17/03/24.
//

import Foundation

// Open-close principle, open for extension, closed for modification.
protocol Shape {
    func calculateArea() -> Double
}
struct Rectangle: Shape {
    let length: Double
    let breadth: Double
    
    func calculateArea() -> Double {
        print("Area of rectangle: ")
        return length * breadth
    }
}

struct Circle: Shape {
    let radius: Double
    
    func calculateArea() -> Double {
        print("Area of circle: ")
        return radius * radius
    }
}


//pragma mark: Liskou Principle
class Bird {
    func fly() {
        print("Can fly")
    }
}


class Ostrich: Bird {
    override func fly() {
        print("Cannot fly")
    }
}

class Eagle: Bird {
    //No need to override fly as eagle can fly.
}


//Dependency inversion
protocol Bulb {
    func switchOn()
    func switchOFF()
}

class LEDBulb: Bulb {
    func switchOn() {
        print("Led bulb toggle on")
    }
    func switchOFF() {
        print("Led bulb toggle off")
    }
}

class OLEDBulb: Bulb {
    func switchOn() {
        print("OLed bulb toggle on")
    }
    func switchOFF() {
        print("OLed bulb toggle off")
    }
}

protocol ControlPanel {
    func makeToggle(bulb: Bulb)
}
class SwitchBoard: ControlPanel {
    var toggle: Bool = false
    func makeToggle(bulb: Bulb) {
        toggle ? bulb.switchOn() : bulb.switchOFF()
    }
}
