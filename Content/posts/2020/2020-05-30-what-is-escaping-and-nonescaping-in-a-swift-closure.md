---
title: "What is @escaping and @nonescaping in a Swift closure?"
date: 2020-05-30 00:00
tags: Swift
---
# What is @escaping and @nonescaping in a Swift closure?

A Closure is a block of code that can pass around data. Closure's are similar to functions but have special attributes. One feature of what makes closure's special is that the block of code inside the closure can live passed the function they are called in. It does this by retaining a copy of the closures code in memory until it finishes executing. More about that in a bit, let's look at an example of a simple closure below.

let greetingClosure = { (name:String) -> String in  
    return "Hello \\(name)!"  

}  

let message = greetingClosure("Swift Tom")  

print(message)

// Output: Hello Swift Tom!

In the example above we have a closure variable that takes in a parameter and returns a string. When the example above is called its value is assigned to our closure variable and then printed out.

Now that we have seen a basic closure let's look at when to use **@escaping** and **@nonescaping** in a closure.

A common example of a **@escaping** closure would be a completion handler. Completion handlers run asynchronous tasks like a network call. Let's look a example of a network call below.

func performRequest(parameters: \[String: String\], completionHandler: @escaping (Result<Data, Error>) -> Void) {
   
 var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = try! JSONEncoder().encode(parameters)

    let task = URLSession.shared.dataTask(with: request) { data, \_, error in
        guard let data = data else {
            completionHandler(.failure(error!))
            return
        }
        completionHandler(.success(data))
    }
    task.resume()
}

The **@escaping** allows for the closure to be retained in memory until the completion handler either returns success on the network call or a failure. The **@escaping** outlives the function it was created in to retrive the data we are requesting.

A **@nonescaping** closure is the opposite of **@escaping** and doesn't live past the function it was called in. Below is an example of a **@nonescaping** closure.

func calculateSumOf(array:\[Int\],  handler: ((Int)->Void)) {  
        var sum: Int = 0  
        for value in array {  
            sum += value  
        }  
            handler(sum)  
    }  

func getSum() {  
        self.calculateSumOf(array: \[22, 18, 9, 50\]) { \[weak self\] sum in  
        
        print(sum)  
        // finishing the execution  
        }  
    } 

getSum()
//Output: 99

In the above example we can see that the function getSum( ) will calculate the sum of the values passed into the array. Once the function finishes running the closure will not be retained memory.

All closures by default are **@nonescaping** closure’s. The first example I used in this post is also a **@nonescaping** closure.

The reason for all closures being **@nonescaping** by default is performance and code optimization for the compiler. If the compiler knows that the closure is **@nonescaping** it can manage the memory allocation in the closure much faster because it doesn't have to retain memory until it is returned like in a **@escaping** closure.

If you want to learn more about closures and how to use them checkout the excellent Swift documentation on [closures](https://docs.swift.org/swift-book/LanguageGuide/Closures.html).

Hope this helps to explain escaping and non-escaping closure.

␛ Happy Coding 🚫␛
