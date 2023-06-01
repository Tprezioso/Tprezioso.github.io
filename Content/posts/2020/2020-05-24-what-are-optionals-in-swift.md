---
title: "What are Optionals in Swift"
date: 2020-05-24 00:00
tags: Swift
---
# What are Optionals in Swift

A optional in Swift is the handling of **nil** in a variable. We check to see if our value is **nil** by a process we call unwrapping. Similar to a box that came in the mail, we have no idea if the box has anything inside or if it has **nil** inside. The only way to find out is by unwrapping it. Let's look at a example to see how we can handle unwrapping optionals.

import UIKit

var studentScores: \[Int\] = \[81, 77, 65, 93, 55\]
studentScores.sort()

// if let
if let topScore = studentScores.last {
    // If topScore has a value
    print("The top score in the class is \\(topScore)")
} else {
    // If nil
    print("There are no student scores")
}

// guard let
func getTopScore() {
    // If topScore is nil break out of the function
    guard let topScore = studentScores.last else {
        return
    }
    print(topScore)
}

// nil coalescing
    // allows us to set a default value of the same type if nil
let topScore = studentScores.last ?? 100

// force unwrap
let highestScore = studentScores.last!

In the above example we are trying to see what the students top score was in the class. Let's pretend that we don't know if the **studentScores** array is nil. In the example we use the 4 main ways to handle unwrapping optionals in Swift.

The first way we handle an optional value is by using a **if let statement**. A **if let statement** allows us to check the variable and then handle the value in a **if else statement**.

The second way is using a **guard let statement**. A **guard let statement** can only be used inside of a function. This way of checking an optional is like a line in the sand because if the **guard let statement** finds that the variable is **nil** it will no longer run the code inside of the function.

The third method of unwrapping is called **nil coalescing**. This allows us to set a default value of the same type if the value is nil.

Our last way of unwrapping an optional is by force unwrapping. This is dangerous to do because if the value turns out to be nil your app will crash. You should only force unwrap if you know the value can never be nil.

Hope this helps you to better understand optionals in Swift.

👨🏻‍💻 Happy Programming! 👨🏻‍💻
