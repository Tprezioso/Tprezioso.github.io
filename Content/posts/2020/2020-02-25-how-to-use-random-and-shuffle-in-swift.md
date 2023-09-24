---
date: 2020-02-25 00:00
title: "How to Use .random and .shuffle in Swift"
tags: Swift
---
# How to Use .random and .shuffle in Swift

This is a short tutorial about how to use random and shuffle in swift. Let's get started by opening up a swift playground in Xcode or on the iPad. Copy the code below into your playground

// 1 
var randomNumbersArray: \[Int\] = \[\]
 
// 2
 for \_ in 0...24 {
// 3
    let randomNumber = Int.random(in: 1...100)
// 4
    randomNumbersArray.append(randomNumber)
 }

 print(randomNumbersArray)
// OUTPUT: \[81, 36, 37, 25, 18, 52, 58, 99, 13, 31, 8, 21, 12, 56, 45, 26, 52, 50, 12, 78, 31, 39, 31, 45, 1\]

// 1 Above we setup and **randomNumbersArray**. Which is just and array of Ints.

// 2 Next we set a For Loop that will loop 25 times.

// 3 Each time the loop runs we add one random number between 1 and 100.

// 4 Then we added the random number to the **randomNumbersArray**.

If you copy the code above into your swift playground you will get a different print statement then me because we are using **.random**!

Pretty cool!

We can also use the **.random** on a bool as well. Let's say you wanted to make an app that flips a coin.

let coinFlip = Bool.random()
print(coinFlip)
//OUTPUT: False

Each time you run the code you have a 50/50 chance of getting either true or false.

We can also use **.random** on doubles as well to get thinks like random percentages.

let randomDouble = Double.random(in: 0...1)
print(randomDouble)
//OUTPUT: 0.4773190050526464

If you run the code above then you can take the decimal you have and multiply it by 100 and now you have random percentages you can use for maybe a gaming app.

What if you just want to get a random element from an array you already have? Well we can use the code below to accomplish this task.

 if let randomElement = randomNumbersArray.randomElement() {
    print(randomElement)
 }
//OUTPUT: 26

Note that we use a **if let** statement unwrap the array because the array is optional and we don't know the array is nil.

Lastly let's go over **.shuffle**. Shuffle allows us to make a random set of data. To show this add the following code below.

// 1 
randomNumbersArray.sort()
// OUTPUT: \[1, 5, 8, 12, 12, 15, 24, 24, 29, 31, 32, 32, 35, 45, 46, 47, 53, 65, 66, 70, 82, 88, 91, 92, 98\]
 
// 2
 randomNumbersArray.shuffle()
// OUTPUT:\[65, 24, 32, 31, 12, 70, 66, 47, 5, 88, 45, 24, 46, 1, 53, 35, 91, 92, 15, 32, 82, 8, 12, 29, 98\]

// 1 In the code above we first make order of the array with **sort()** so that we can demonstrate how shuffle works. The sort function just orders the arrays values from smallest to largest.

// 2 Now we have a shuffled array!

This was just a quick tutorial of how **.shuffle** and **.random** can be very powerful and convenient Swift functions. Also If you are like me and like to learn by from video tutorials please check out this [tutorial by Sean Allen](http://bit.ly/394f488) which inspired this post! Happy coding! 👨🏻‍💻💻
