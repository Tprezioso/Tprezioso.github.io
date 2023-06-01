---
date: 2020-02-19 00:00
title: "How to Use .map(_:) in Swift"
tags: Swift
---
# How to Use .map(_:) in Swift

In this tiny tutorial we are going to learn how to use the map() in Swift. The map() function is used to iterate and transform elements in an array. To get a better understanding of this let's look at some examples.

Let's say we have an array like the one below.

var names = \["tom", "steve", "jony", "woz", "swift"\]

If we wanted to capitalize each name in the array we would have to use a For Loop with the **.capitalized** function in swift.

var names = \["tom", "steve", "jony", "woz", "swift"\]
var tempArray = \[String\]()

for name in names {
    tempArray.append(name.capitalized)
    names = tempArray
}

print(names)
//Output \["Tom", "Steve", "Jony", "Woz", "Swift"\]

With map() we can complete the same task of capitalizing each name with less code. Below is the code we would use.

var names = \["tom", "steve", "jony", "woz", "swift"\]

let capitalizedNames = names.map { (name) -> String in
    return name.capitalized
}

print(capitalizedNames)
//Output \["Tom", "Steve", "Jony", "Woz", "Swift"\]

What is going on in the code above is the map() function can be used with a closure. Basically we are doing the same as the For Loop by creating a parameter called **name** and returning a **string**. Here we are returning the iterated element only capitalized just like in the previous example.

We can even break this code down further into a one liner if we wanted to like the code below.

var names = \["tom", "steve", "jony", "woz", "swift"\]

let capitalizedNames = names.map { $0.capitalized }

print(capitalizedNames)
//Output \["Tom", "Steve", "Jony", "Woz", "Swift"\]

This is very similar to the last example the only difference is that in the closure we use the $0 to represent the iterated item in the loop and we tell it to set it as capitalized. The $0 is a shorthand in swift programming but can be unclear and not very readable to some so I prefer the long form.

I hope this short article gives you some closure on what is map() function.

Happy programming 💻💻💻
