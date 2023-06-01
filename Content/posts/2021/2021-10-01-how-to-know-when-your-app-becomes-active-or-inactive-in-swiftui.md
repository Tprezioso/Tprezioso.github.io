---
title: How to Know When Your App Becomes Active or Inactive in SwiftUI
date: 2021-10-01 01:00
published-on: 2021-10-01
tags: Swift, SwiftUI
---
# How to Know When Your App Becomes Active or Inactive in SwiftUI

Recently I was working on a SwiftUI project were I needed to know when my app became active from being in the background. Like most things in SwiftUI, I found out that this was really simple to implement in my project.

In SwiftUI we have a environment element called **[scenePhase](https://developer.apple.com/documentation/swiftui/scenephase)**. What ****[scenePhase](https://developer.apple.com/documentation/swiftui/scenephase)**** allows us to do is monitor if the app is Active, Inactive, or in the Background. Lets take a look at how we can use this in our project.

The first thing we will need to do is add the following variable to your code:

```
@Environment(\.scenePhase) var scenePhase
```

This Environment variable is the key to monitoring what state your app is in. Next we will add an **.onChange** modifier to our view. This will allow us to see when our apps state has changed and then act on that change. Let’s now take a look at how I used the ****[scenePhase](https://developer.apple.com/documentation/swiftui/scenephase)**** variable to reload a specific view when my app became active again.

```
struct TodayWatchView: View {
    @StateObject var viewModel = TodayWatchViewModel()
    
    // 1) added scenePhase variable
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        ZStack {
            VStack {
                if !viewModel.isHolidaysEmpty {
                    List(viewModel.holidays) { holiday in
                        if holiday.url == "" {
                            Text("\(holiday.name)")
                                .font(.headline)
                                .bold()
                        } else {
                            NavigationLink(holiday.name, destination: HolidayWatchDetailView(holiday: holiday))
                        }
                    }
                } else {
                    EmptyState(message: "There was an issue loading Today's Holidays!\n Try again later")
                }
            }
            
            // 2)
            // Reload data when app becomes active!!
            .onChange(of: scenePhase) { newPhase in
                if newPhase == .inactive {
                    print("Inactive")
                } else if newPhase == .active {
                    viewModel.getHolidays()
                } else if newPhase == .background {
                    print("Background")
                }
            }
            .navigationTitle("Today Is....")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert.init(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
            .onAppear {
                viewModel.getHolidays()
            }
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                    .scaleEffect(2, anchor: .center)
            }
        }
    }
}
```

I hope this gives you a better understanding of how you can monitor your app and run functions depending on your apps state.

Thanks for reading and happy coding!!! 👨🏻‍💻👨🏻‍💻👨🏻‍💻
