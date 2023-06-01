---
title: "What is ARC memory management in Swift"
date: 2020-04-27 00:00
tags: Swift
---
# What is ARC memory management in Swift

What is **ARC**? **ARC** stands for **Automatic Reference Counting**. Reference counting is a way of storing number references or pointer to a object. In short **ARC** helps to store references into memory and helps clean up memory when it is not being used.

Apples documentation says “Memory management “just works” in Swift, and you do not need to think about memory management yourself. **ARC** automatically frees up the memory used by class instances when those instances are no longer needed.”

**ARC** uses references like **strong**, **weak**, or **unowned** as a way of knowing when to free memory for a given object. By default when we declare a class property its a **strong** reference type. In this post we will take a look at how to use **strong** and **weak** references in **ARC**.

Let’s take a look at the example code below.

class Person {
     var name: String
     var device: Device?
     init(name: String, device: Device?) {
        self.name = name
        self.device = device
     }
}

class Device {
     var owner: Person?
     var device: String
     init(owner: Person, device: String) {
        self.owner = owner
        self.device = device
     }
}

In the above example we created two classes, a **Person** class and a **Device** class. We created these classes to show an example of a **strong** reference cycle.

The **Person** class has a **strong** reference to the ****Device**** class through it’s ****device**** property, and ****device**** has a **strong** reference to **Person** through its **owner** property. The problem with this is that these objects hold **strong** references to one another. This means that **ARC** is unable to deallocate memory when one of the objects are removed because they reference one another. This creates a memory leak in our code.

To fix our **strong** reference cycle problem we will have to set our **device** variable to a **weak** variable type in our **Person** class. This allows the variable to be deallocated from memory when its not need.

class Person {
     var name: String
     weak var device: Device?
     init(name: String, device: Device?) {
        self.name = name
        self.device = device
     }
}

class Device {
     var owner: Person?
     var device: String
     init(owner: Person, device: String) {
        self.owner = owner
        self.device = device
     }
}

Above we now have the **Device** class with a **strong** reference to the **Person** class, but the **Person** class has a **weak** reference to the **Device** class.

When we use a **weak** reference type on a object it needs to be a optional because it has to have the ability to become nil. If the **Device** class variable becomes nil our **Person** class will deallocate or release the memory stored. This corrects our **strong** reference cycle and stops our memory leak.

**A good rule of thumb**:

A **Strong** references should be used when a parent object is referencing a child object.

A **Weak** references should be used to avoid retain cycles.

This is a brief look at how **ARC** memory management works. For a deeper dive into **ARC** I recommending checking out the Swift documentation on [Automatic Reference Counting](https://bit.ly/2L94na0).

I hope this opened the curtain to what goes on behind the scenes of Swift memory management and helps to shed some light on how **ARC** works in Swift.

👨🏻‍💻 Happy Programming! 👨🏻‍💻
