---
title: "Integrating MapKit with SwiftUI"
date: 2020-03-08 00:00
tags: Swift, SwiftUI, MapKit
---
# Integrating MapKit with SwiftUI

In this article we are going to make a simple map in SwiftUI. This map will show the users location and show how we can set pins (annotations) on our map.

Let's get started by opening a new Xcode project and adding a new SwiftUI file to our project named MapView.swift.

The first thing we are going to want to do is import MapKit and conform our struct to the UIViewRepresentable delegate.

import MapKit
import SwiftUI
struct MapView: UIViewRepresentable {
    
}

Next we are going to add the CLLocationManager to get our users location and set up our location manager. Add the following code below to our struct.

    var locationManager = CLLocationManager()
    
    func setupManager() {
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
      locationManager.requestWhenInUseAuthorization()
      locationManager.requestAlwaysAuthorization()
    }

The code above is asking the user for permission so the location manager will know the devices location. There is an extra step here that we have to implement. We need to go into are info.plist and add a privacy property.

Hit the + button in the Information Property List and type "Privacy - Location When In Use Usage Description". On the right side add the message that will be displayed to your user to ask for their location. Then press enter and your plist should look like the image below.

![](https://swifttom.com/wp-content/uploads/2020/03/screen-shot-2020-03-06-at-4.44.07-pm.png?w=1024)

Now let's return to the MapView.swift File and get rid of these annoying error messages. These errors are because our MapView doesn't conform to the UIViewRepresentable protocol. Let's fix that now by adding the following code below.

    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        setupManager()
        let mapView = MKMapView(frame: UIScreen.main.bounds)
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
    }
    func updateUIView(\_ view: MKMapView, context: UIViewRepresentableContext<MapView>) {
    }

Above we are adding the makeUIView() function and the updateUIView() function. These are both needed to conform to the UIViewRepresentable protocol. Inside the makeUIView() function we call the setupManger() function. We also initialize our mapview with the frame constrained to the whole screen and allow the map to show the user location. We also have the mapview track the user which allows the pin indicating where the user is to move with the user.

Now we can go to the ContentView.swift file and call our MapView.

struct ContentView: View {
    var body: some View {
        MapView()
            .edgesIgnoringSafeArea(.all)
    }
}

If we go and run this code now we should get an alert message for the user to allow the app to have access to the user location. Press allow and then we should see the map then load to the users location.

- ![](https://swifttom.com/wp-content/uploads/2020/03/simulator-screen-shot-iphone-11-pro-2020-03-06-at-16.57.25.png?w=473)
    
- ![](https://swifttom.com/wp-content/uploads/2020/03/simulator-screen-shot-iphone-11-pro-2020-03-06-at-16.57.34.png?w=473)
    

If you are using the simulator it will automatically use Apple's 1 Infinite Loop campus as the user location. If you run this code on your phone it will show you your location.

Awesome we are halfway done!

Next we are going add an annotation or pin to our app. In this example we are going to show how we can add a pin to ortega park in the top right corner of the above map.

First we will add a pin class to our MapView like the code below.

     class pin: NSObject, MKAnnotation {
      let title: String?
      let coordinate: CLLocationCoordinate2D
      
      init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
      }
    }

This is a simple pin (annotation) class that takes in a title and a coordinate.

Next we are going to create an array of our new Pin class like this.

@Binding var pins: \[Pin\]

We make it a @Binding this way it can keep the state of the pins consistent. Next we will update our mapview in the updateUIView() function to add our pins (annotations). Add the following code to our updateUIView() function.

    func updateUIView(\_ view: MKMapView, context: UIViewRepresentableContext<MapView>) {
        view.addAnnotations(pins)
    }

Now inside our ContentView.swift file we will initialize an array of pins. Then we will add our Ortega Park pin to our map. Add the following code below.

struct ContentView: View {
       @State var pins: \[Pin\] = \[
      Pin(title: "Ortega Park", coordinate: .init(latitude: 37.342226, longitude: -122.025617)),
    \]
    var body: some View {
        MapView(pins: $pins)
            .edgesIgnoringSafeArea(.all)
    }
}

Now if we run our code we will see that we added a pin on Ortega Park .

![](https://swifttom.com/wp-content/uploads/2020/03/simulator-screen-shot-iphone-11-pro-2020-03-06-at-17.33.40-1.png?w=473)

Pretty cool!

We learned how to add a map to a view, display the users location, and showed how to add pins (annotations) to our map. I hope this article helps you get started on using maps in your SwiftUI projects.

All the code is [here](http://bit.ly/2wDN2Cc).

Happy programming 💻👨🏻‍💻
