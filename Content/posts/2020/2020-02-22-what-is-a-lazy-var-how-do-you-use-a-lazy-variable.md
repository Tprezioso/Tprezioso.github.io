---
date: 2020-02-22 00:00

title: "What is a Lazy Var? How Do You Use a Lazy Variable?"
tags: Swift
---
# What is a Lazy Var? How Do You Use a Lazy Variable?

**Lazy** variables in swift allow us to delay the creation of objects and only use them when the app needs them. **Lazy** variables help to utilize memory for expensive processes.

Lets see how we can use **lazy** in our apps.

import UIKit

struct MobileDeveloper {
    lazy var iOSDev: String = {
        return "I am an iOS developer"
    }()

    lazy var androidDev: String = {
        return "I am an Android developer"
    }()
    
    mutating func mobileDev(isiOSDev: Bool) -> String {
        if isiOSDev {
            return iOSDev
        } else {
            return androidDev
        }
    }
}

var person1 = MobileDeveloper()
person1.mobileDev(isiOSDev: true)

// Output: "I am an iOS developer"

Above is a struct called Mobile Developer. Inside the struct we create two **lazy** variables that return if the mobile developer is a iOS Developer or a Android Developer.

We use the **lazy** syntax above because the Mobile Developer struct will only be set to one kind of developer, so we don't want to initialize both and waste any memory. Whichever variable is called on in the function will initialize what kind of developer is set to our person variable.

Below is another example given by Paul Hudson from his [article](https://www.hackingwithswift.com/example-code/language/what-are-lazy-variables) on Lazy variables.

struct Person {
    var age = 16

    lazy var fibonacciOfAge: Int = {
        return fibonacci(of: self.age)
    }()

    func fibonacci(of num: Int) -> Int {
        if num < 2 {
            return num
        } else {
            return fibonacci(of: num - 1) + fibonacci(of: num - 2)
        }
    }
}

In Paul's example he uses a **lazy** variable to determine what the fibonacci number would be for a particular age.

This is a great example of when to use a lazy variable because as the age variable gets higher the fibonacci function will take longer to figure out the right number to match with the age.

Paul's example shows by making a lazy variable we are not using unnecessary processes if we don't need to determine the fibonacci age. This makes the code really fast if we don't need to process the fibonacciOfAge variable.

Lazy variable are an amazing tool to use in swift for making your code super fast and efficient. I hope this article helps you on your coding journey! Happy Programming! 👨🏻‍💻💻👨🏻‍💻
