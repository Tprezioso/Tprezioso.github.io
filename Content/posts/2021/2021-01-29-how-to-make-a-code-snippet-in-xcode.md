---
title: "How to Make a Code Snippet in Xcode"
date: 2021-01-29 00:00
tags: Xcode
---

# How to Make a Code Snippet in Xcode

Code snippets are shortcuts to blocks of boilerplate code that we use most often when programming. Xcode allows us to add custom snippets to the many pre-existing snippets that Apple provides. Let's see how we can make a code snippet out of the following code below.

```
DispatchQueue.main.async {
                    
                }
```

You might be familiar with the example code above. This block of code is used to make sure things like network calls are made on the main thread and not on a background thread. Let's make a code snippet of this so we don't have to type the whole thing out every time we want to use it.

If we highlight the code and then right click (⌘ + click) you will see an option to "Create Code Snippet".

![](/images/Screen-Shot-2021-01-29-at-5.53.45-PM.png)

Once we click on "Create Code Snippet" a window will popup and prompt us to customize our code snippet.

![](/images/Screen-Shot-2021-01-29-at-5.55.10-PM.png)

First we will name our snippet "Dispatch Main Queue" (Feel free to name it whatever you want 😄). Now we will leave everything else the same except the "Completion" section. In the "Completion" textfield we will type in "dpm".

![](/images/Screen-Shot-2021-01-29-at-5.59.41-PM.png)

What this does is every time we type "dpm" Xcode will prompt us in the autocompletion to see if we want to use our code snippet! So from now on anytime we want to put something on the main thread all we have to do is type "dpm" and we get our code snippet we just created.

![](/images/Screen-Shot-2021-01-29-at-6.05.13-PM-1.png)

![](/images/Screen-Shot-2021-01-29-at-6.05.30-PM-1.png)

Just like that we have made a code snippet and saved ourselves time by never having to type out all that code ever again! Feel free to make code snippets of any block of code your tired of typing out! Embrace your laziness!

Thanks for reading and I hope this helps your coding productivity.

Happy coding!

![Texas Tribune Nerds - What I Learned at The Texas Tribune](https://64.media.tumblr.com/26460fbabb524c6906212d60cb0bfe2e/tumblr_inline_pae21mGEP91s6q7r3_500.gifv)
