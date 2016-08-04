# Extensions - Reading

![Ruth](http://i.imgur.com/W8XC1YB.jpg?1)  

> Courage is like a muscle. We strengthen it by use. -[Ruth Gordon](https://en.wikipedia.org/wiki/Ruth_Gordon)
 

## Learning Objectives 

* Create extensions on built-in swift types
* Create extensions on your own custom types


# Extensions

We know now how to work with various different types. Types built into Swift such as `Int`, `Double`, `String`, `Array`.

```swift
var age = 100
var weight = 204.2
let favoriteToy = "Woody"
let words = ["Life", "Is", "Great"]
```

We also know how to create our own types. Here I'm creating a `Person` class and a `Point` struct.

```swift
class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
```

```swift
struct Point {
    var x: Double
    var y: Double
}
```

If we take a look at `Int` for a minute, when we create a variable of type `Int`, that variable has access to all of the functions & properties implemented by Apple.
```swift
var coolNumber = 752
```

Here we created a variable of type `Int` where we're assigning it the value 752. What if we want to square this value?

```swift
coolNumber * coolNumber
// 565504
```

Easy enough. But what if we want to be able to provide this functionality throughout our entire application? Can we solve that problem by doing it like this everywhere we need to square the number? Sure. But there's an easier way. Is creating a function the answer?

```swift
var coolNumberSquared = squareNumber(coolNumber)
// 565504
```

This also works, but.. if we want to be able to utilize this function throughout our application, if there are multiple files in our app, we would need to copy & paste this function across all of our files. There must be an easier way! There is.

**Extensions** 

![](http://i.giphy.com/PAQgKcl8JqZwc.gif)

Extensions add new functionality to an existing class, structure, enumeration, or protocol type. This includes the ability to extend types for which you do not have access to the original source code (known as retroactive modeling).

```swift
extension Int {
    
    
}
```

We've created an extension. We're extending `Int`. We can now provide every single `Int` being used in our application some additional functionality. Where would you write this code? Well, you can write it anywhere within your Xcode project in a .swift file. I tend to create extensions within files that will be utilizing this added functionality the most. You can also create a new .swift file that _just_ includes the extension.

Lets provide it with a function that prints "Hello. I'm a number. x.". x being the current value of `self`.

```swift
extension Int {
    
    func hello() {
        print("Hello. I'm a number. \(self).")
    }
    
}
```

```swift
let coolestNumber = 7
coolestNumber.hello()
// prints "Hello. I'm a number. 7."
```

Notice that the value of `self` is the value of the constant here. In this example, `self` is the `coolestNumber` constant and the value of that `constant` is 7, so that is what prints to the console here.

I think this is pretty cool. Here we are providing functionality across our entire app for every single `Int`. Every `Int` now has the ability to call this function (even though it is a pretty useless function right now).

Lets provide some functionality for any instance of `Int` to be able to square itself.

```swift
extension Int {
    
    func hello() {
        print("Hello. I'm a number. \(self).")
    }
    
    var squared: Int {
        return self * self
    }
    
}
```

Here I created a computed read-only property called `squared` of type `Int`. This means that we can assign a value to this property, we can only read the value produced by it. So when this property is called, it will return back a value to the person calling on it. It will return `self` * `self`.

```swift
var cashOnHand = 50

cashOnHand.squared
// 2500
```

I created a variable of type `Int` assigning it the value of 50.

Then, we are calling on the `squared` computed read-only property on the `cashOnHand` variable which is of type `Int`. Because it's of type `Int`, it has the ability to call on that property. It's returning back the value 2500. It's _not_ changing the value of `cashOnHand`. `cashOnHand` is still 50. This computed read-only property is only returning back a new value that we can use.

So what if we wanted to add functionality to this type that would change its value.

We can.

`Int`'s are structs. This means that if we are to create a function that will _mutate_ or change its current value, then we need to mark the function as mutating. Lets do that.

```swift
extension Int {
    
    func hello() {
        print("Hello. I'm a number. \(self).")
    }
    
    var squared: Int {
        return self * self
    }
    
    mutating func add(number: Int) {
        self += number
    }
    
}
```

The name of this function is `add` and it takes in one argument of type `Int` which will represent a number. In our implementation, we are changing the value of `self`. `self` representing that current instance of `Int` which is calling on this particular function because only an instance of `Int` has the ability to call on `add()`. 

These both accomplish the same thing:
```swift
self += number
self = self + number
```

So in our implementation, we are changing the value of `self`. We are taking in the number passed into this function and adding it to `self`. 

Lets look at an example.

```swift
var cashRegister = 1000

cashRegister.add(45)

print(cashRegister)
// prints "1045"
```

Lets create a function that simulates a cash register. I would argue that you should then just create a Cash Register class, but I want to show you that you can do just about whatever you like within an Extension.

```swift
extension Int {
    
    func hello() {
        print("Hello. I'm a number. \(self).")
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
```

This mutating function is called `payOutFunds()` which takes in one argument of type `Int` representing a number. It returns back a `String`. It first checks to see if subtracting the number passed in from `self` would result in a negative number. If so, it won't subtract anyting from `self`, it will just return back the `String` "I don't have the money". I won't step through the rest, but it is similar to the first if statement.

```swift
var cashRegister = 3000

var displayText = cashRegister.payOutFunds(1000)
print(displayText)
// prints "I have 2000 funds available now."

var displayText2 = cashRegister.payOutFunds(55555)
print(displayText2)
// prints "I don't have the money."
```

![](https://media.giphy.com/media/ND6xkVPaj8tHO/giphy.gif)

Here's a great example from Apples Documentation where they extended the `Double` type to provide some additional functionality. Here they created 5 computed read-only properties which return back a `Double`.

```swift
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
// prints "One inch is 0.0254 meters"

let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
// prints "Three feet is 0.914399970739201 meters"
```

# Extending Other Types

You can use Extensions to organize your code. What does that mean?

Lets just right into an example.

```swift
class Person {
    var name: String
    var isSleepy: Bool = true
    var isHungry: Bool = true
    
    init(name: String) {
        self.name = name
    }
}

// Eating Methods
extension Person {
    
    func eat() {
        isHungry = false
    }
    
	func eatAbigMac() {
        isHungry = false
        isSleepy = true
    }
    
}

// Sleeping Methods
extension Person {
    
    func sleep() {
        isSleepy = false
    }
    
}
```

I'm creating a `Person` class with three properties. `name` which is a variable of type `String`. `isSleepy` is a variable of type `Bool` with a default value of `true`. `isHungry` is a variable of type `Bool` with a default value of `false`. 

Considering we've provided default values for the `isSleepy` and `isHungry` properties, we aren't required to include them in our `init`. 

We've also used extensions to organize our a code a little. Here I'm creating an extensoin on `Person` to provide all of the functions relating to eating.

Then I created another function relating to just the sleeping methods.

# What can't you do with extensions?

You can't provide a stored property in an extension. You can only provide stored properties (like the `name` property above) within the declaration of the type itself. Well, this isn't a problem when you're the one creating the type (like `Person`), but you won't be able to provide stored properties on the built-in types like `String`, `Int`, etc. Why? Because we don't have access to the declaration of those types.




<a href='https://learn.co/lessons/Extensions' data-visibility='hidden'>View this lesson on Learn.co</a>
