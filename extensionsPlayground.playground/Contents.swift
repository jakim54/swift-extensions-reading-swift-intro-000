//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Different value types
var age = 100
var weight = 204.2
let favoriteToy = "Woody"
let words = ["Life", "Is", "Great"]

// Different reference types
class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

struct Point {
    var x: Double
    var y: Double
}

// Examples:
// An instance of Int
var coolNumber = 752

// Function to square this number, although a native one exists .sqrt
func squareNumber(number: Int) -> Int {
    return number * number
}

squareNumber(number: coolNumber)
// Extensions used in cases where you want to use the function throughout the entire app without re-writing it everywhere and to modify/extend original code source without modifying the actual code source. Retroactive Modeling.

// Extension below commented out due to the same example being iterated upon. The bottom most example to reflect the most updated example.
/*
extension Int {
    func hello() {
        print("Hello. I'm a Number and it's \(self)")
    }
}

let coolestNumber = 7
// self is the value of coolestNumber in this case.
coolestNumber.hello()
// Every Int will now be able to call self.hello() to print itself with a message. An extension of class Int.
*/

// First iteration of the extension example on an Int
/*
extension Int {
    
    func hello() {
        print("Hello. I'm a Number and it's \(self)")
    }
    
    var squared: Int {
        return self * self
    }
    
    
}

var cashOnHand = 50
cashOnHand.squared
print(cashOnHand)
// did not change the value as the computer property is a get/read only and not set.
*/

/*
// Created an extension with a mutating function, as add is already defined in Int class
extension Int {
    
    func hello() {
        print("Hello. I'm a Number and it's \(self)")
    }
    
    var squared: Int {
        return self * self
    }
    
    mutating func add(number: Int) {
        self += number
        // can also do self = self + number
    }
    
}

var cashRegister = 1000
cashRegister.add(number: 45)
// cashRegister will now show 1000 + 45.
print(cashRegister)
*/

/*
// Another iterated exmaple of an extension regarding a mutating func shown
extension Int {
    
    func hello() {
        print("Hello. I'm a Number and it's \(self)")
    }
    
    var squared: Int {
        return self * self
    }
    
    mutating func add(number: Int) {
        self += number
    }
    
    mutating func payOutFunds(number: Int) -> String {
        if (self - number) < 0 {
            return "I don't have the money."
        } else if (self - number) == 0 {
            self -= number
            return "I'm no broke."
        } else {
            self -= number
            return "I have \(self) funds available now."
        }
    }
}

var cashOnRegister = 3000
var displayText = cashOnRegister.payOutFunds(number: 1000)
// prints 2000 as 1000 was subtracted.
var displayText2 = cashOnRegister.payOutFunds(number: 55555)
// No money was taken out as the amount blows over 0.
*/

/*
// Example of extended methods within Double.
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")

let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
*/

// An example of a class, with extended methods to compensate/compliment the class Person.
// Notice that each extension for the class is written as an extension Human. Just adding the additional code within the successive extension being written.
class Human {
    var name: String
    var isSleepy: Bool = true
    var isHungry: Bool = true
    
    init(name: String) {
        self.name = name
    }
}

// Extending eating methods
extension Human {
    func eat() {
        isHungry = false
    }
    
    func eatBigMac() {
        isHungry = false
        isSleepy = true
    }
}

// Extending sleeping methods
extension Human {
    func sleep() {
        isSleepy = false
    }
}

let becca = Human(name: "Becca")
print("\(becca.name)\n\(becca.isHungry)\n\(becca.isSleepy)")
// all values are true, which is the default

becca.eat()
print("\(becca.name)\n\(becca.isHungry)\n\(becca.isSleepy)")
// isHungry is now false, because .eat() changed it

becca.sleep()
print("\(becca.name)\n\(becca.isHungry)\n\(becca.isSleepy)")
// isSleepy is now also false, because .sleep() changed it

print("\nBecca ate a Big Mac\n")
becca.eatBigMac()
print("\(becca.name)\n\(becca.isHungry)\n\(becca.isSleepy)")

/*
 You can't provide a stored property in an extension. You can only provide stored properties (like the name property above) within the declaration of the type itself. Well, this isn't a problem when you're the one creating the type (like Person), but you won't be able to provide stored properties on the built-in types like String, Int, etc. Why? Because we don't have access to the declaration of those types.
 */



