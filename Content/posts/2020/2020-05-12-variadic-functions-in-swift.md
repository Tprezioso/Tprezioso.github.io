---
title: "Variadic Functions in Swift"
date: 2020-05-12 00:00
tags: Swift
---
# Variadic Functions in Swift

What is a variadic function? A **Variadic function** takes in multiple arguments as a parameter. The swift compiler automatically organizes variadic function objects into an array. The arguments of a variadic function are shown by three periods **(…**) after the argument’s type. A good everyday example of this would be a print statement where you can print multiple objects.

![](https://swifttom.com/wp-content/uploads/2020/05/screen-shot-2020-05-09-at-10.43.03-am.png?w=746)

The **"Any..."** in the autocomplete of our print statement shows a variadic function allowing us to print multiple objects.

![](https://swifttom.com/wp-content/uploads/2020/05/screen-shot-2020-05-09-at-12.43.18-pm.png?w=778)

Below is another example on how to use a variadic function inside of a function.

func average(\_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
average(1, 2, 3, 4, 5)
// Output: 3

Above we have a function that finds the average of our **numbers** parameter. The **numbers** parameter is our variadic function, it will take in as many numbers as we want and then use them in an array to calculate the average.

I hope this clears up how a variadic function work!

Happy coding!

👨🏻‍💻💻📱👨🏻‍💻💻📱
