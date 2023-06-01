---
title: "How to Use Switch Statements in Swift"
date: 2020-03-19 00:00
tags: Swift
---
# How to Use Switch Statements in Swift

A switch statement is used to check a variable against a list of possible cases for that variable to then execute. It looks for the first case that matches your variable you want to check and then runs that cases block of code. When that case is finished running its code it will break out from the switch statement.

Let's look at a example.

let numberToCheck = 20

switch numberToCheck {
case 0:
    print("0 is the number")

case 10:
    print("10 is the number")

case 20:
    print("20 is the number")

case 30:
    print("30 is the number")

default:
    print("Number is not 0, 10, 20, 30")
}
//OUTPUT: 20 is the number

Above is a simple example where we are checking to see the value of a number. If that number is a particular number value that matches our case we want it to print out the number of the case value. If the **numberToCheck** doesn't match any of the numbers in our switch case we need a **default** value for the **numberToCheck** value.

We can also have switch statements with a range.

let numberToCheck = 40

switch numberToCheck {
case 0...10:
    print("The number is between 0 and 10")

case 10...20:
    print("The number is between 10 and 20")

case 20...30:
    print("The number is between 20 and 30")

case 30...40:
    print("The number is between 30 and 40")

default:
    print("The number is below 0 and above 40")
}

//OUTPUT: The number is between 30 and 40

Above we are using our **numberToCheck** variable to see what print statement it should make in specific range of numbers. For example if our **numberToCheck** is 7 the print out would be "The number is between 0 and 10".

That's all there is too it.

Switch statements are great for checking a variable against multiple options and then being able to execute a block of code based on your variables value.

I hope this helps clean up your code from having a lot of crazy "if" statements.

👨🏻‍💻 Happy Coding 👨🏻‍💻
