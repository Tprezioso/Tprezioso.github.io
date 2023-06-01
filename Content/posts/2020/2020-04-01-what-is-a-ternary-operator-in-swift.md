---
title: "What is a Ternary Operator in Swift"
date: 2020-04-01 00:00
tags: Swift
---
# What is a Ternary Operator in Swift

A ternary operator takes a condition and then returns either true or false depending on the value of the condition. The basic syntax can be seen in the example below.

CONDITION ? TRUE VALUE : FALSE VALUE

This can be used as an alternative or a shorthand to If statements.

Let check out an example below.

var ourSpeed = 55

var speedLimit = 50

var currentSpeed = ourSpeed > speedLimit ? "Over Speed Limit" : "Below Speed Limit"

//                |     CONDITION      | ? |      TRUE      | : |      FALSE      |

print(currentSpeed)

// OUTPUT: Over Speed Limit

You can read the ternary example above as “if **ourSpeed** is greater than the **speedLimit** set **currentSpeed** to **"Over Speed Limit"** otherwise set **currentSpeed** to **"Below Speed Limit"**. Because our **speedLimit** was 50, the **currentSpeed** variable will be set to the true value of **"Over Speed Limit"**.

Ternary conditionals can be a little confusing to understand at first but they can be a great way to set variables based on a condition in one line of code. This is great for writing nice clean code.

Hope this helps clear up what is/how to use ternary conditionals.

Happy coding!

👨🏻‍💻💻👨🏻‍💻
