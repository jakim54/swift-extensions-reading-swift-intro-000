# Extensions

![Ruth](http://i.imgur.com/W8XC1YB.jpg?1)  

> Courage is like a muscle. We strengthen it by use. -[Ruth Gordon](https://en.wikipedia.org/wiki/Ruth_Gordon)
 

## Learning Objectives 

* Extensions


## What the student can do at this point 

* Everything above this Unit in the Google Doc


## Outline / Notes

*  `Int` is a type we use often.

```swift
var age = 5
```

* Here we declared a variable named `age` with a value of 5. If we wanted to add 10 to this variable, we know how to do that:

```swift
age += 10
``` 
* The value of `age` is now 15.

* What if we need to be able to get the squared value of any `Int` in our app. Well, we can create a function like so:

```swift
func squared(_ number: Int) -> Int {
    return number * number
}

let favNumber = 7

squared(7) // 49
```
* Easy enough, but.. it is kind of hard to read. Also, I feel like it should be some sort of functionality on the `Int` type itself, it should know how to square itself! But we didn't implement this `Int` struct, Apple did.
* The answer is Extensions.
  
> Extensions add new functionality to an existing class, structure, enumeration, or protocol type. This includes the ability to extend types for which you do not have access to the original source code (known as retroactive modeling).

* We can extend this `Int` type to provide functionality that was not originally part of its implementation. In doing this, it will carry through to every `Int ` in our software!

```swift
extension Int {
    
    // do what ya want!
    // except no new stored properties!
    
}
```

* That's it. After the keyword `extension` you include the type you want to extend, in this case.. we want to extend the type `Int` - following that are curly braces `{ }`. Inside of those curly braces `{ }` is where we add the additional functionality. We can add computed properties, methods and initalizers amongst other things. We can't though provide NEW stored properties.

```swift
extension Int {
    
    var squared: Int {
        return self * self
    }
    
}
```

* Here we're creating a read-only computed property of type `Int` that when called on will return self * self. What is self here? It represents the instance of `Int` that is calling on this read-only computed property.

```swift
let ageOfTurtle = 8
ageOfTurtle.squared // 64
```

* In this example, `self` is `ageOfTurtle` which has a value of 8 - so 8 * 8 = 64.

---

* Maybe copy Apple's example (which is a great one!), maybe it's a little too involved:

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
// Prints "One inch is 0.0254 meters"

let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
// Prints "Three feet is 0.914399970739201 meters”

```

* We should also show them how they can extend their own types and add functions.
* They will have not seen Protocols yet, so we can't show them that.




<a href='https://learn.co/lessons/Extensions' data-visibility='hidden'>View this lesson on Learn.co</a>
