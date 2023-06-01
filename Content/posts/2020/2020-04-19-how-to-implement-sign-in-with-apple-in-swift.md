---
title: "How to Implement Sign in with Apple in Swift"
date: 2020-04-19 00:00
tags: Swift
---
# How to Implement Sign in with Apple in Swif

At the 2019 WWDC, Apple announced Sign in with Apple which allows users to sign into applications and websites securely. Sign in with Apple ensures privacy by not tracking your sensitive information and also provides a synchronous experience across all your Apple devices. The best part is that it is offered in browsers for platforms like Android and Windows devices through Sign in with Apple JS.

Today we are going to take a look at how we can add Sign in with Apple into our swift app. Let's start by opening a new Swift project in Xcode.

First thing we have to do is enable Sign in with Apple. We do this by going to our target and going to the **Signing & Capabilities**. Then in the left corner hit the **+** button and type in Sign in with Apple.

![](https://swifttom.com/wp-content/uploads/2020/04/screen-shot-2020-04-14-at-4.34.53-pm.png?w=1024)

Now we’re ready to add a Sign in with Apple button in our application. To implement this we need to import **AuthenticationServices** library and then make a **ASAuthorizationAppleIDButton**. Let look at the example below.

import UIKit
import AuthenticationServices

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSignInWithAppleButton()
        
    }

    func configureSignInWithAppleButton() {
        
        // Create sign in button
        let signInButton = ASAuthorizationAppleIDButton()
        
        //Add to view
        self.view.addSubview(signInButton)
        
        // Function for the action of our button
        signInButton.addTarget(self, action: #selector(ViewController.signInButtonTapped), for: .touchDown)
        
        // Remove constraints so we can add them programmatically
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Added button constraints
        NSLayoutConstraint.activate(\[
            signInButton.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 1),
            signInButton.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 1),
            signInButton.heightAnchor.constraint(equalToConstant: 40),
            signInButton.widthAnchor.constraint(equalToConstant: 200)
        \])
    }
}

In the code above we are importing **AuthenticationServices** and then setting up our Sign in with Apple button programmatically.

First we create our button variable with our **signInButton**. Next we add our button to the subview. Then we add a target action to our button and remove the auto resizing constraints. Lastly we add the constraints for our sign in button.

Next we need to handle what happens when our sign in button is tapped. Let us take a look at the following code.

    @objc private func signInButtonTapped() {
        let authorizationProvider = ASAuthorizationAppleIDProvider()
        let request = authorizationProvider.createRequest()
        request.requestedScopes = \[.email\]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: \[request\])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }

The **signInButtonTapped()** function will be called on when our button is tapped. What we are doing inside the function is creating our **authorizationProvider** and then creating a request to get the users information that we want to be able to use in our app. In this case we are only requesting for the users email but we can also ask for the users full name. Next we create a **authorizationController** to present to the user that will ask for permission to use their email information.

Now we need to handle the **ASAuthorizationController** delegate. This is where we will handle the users information once we are allowed access to the users email. To implement this we are going to add and extension at bottom of swift file outside of the viewcontroller.

extension ViewController: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential else {
            return
        }
        
        print("AppleID Credential Authorization: userId: \\(appleIDCredential.user), email: \\(String(describing: appleIDCredential.email))")
        
    }
    
func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("AppleID Credential failed with error: \\(error.localizedDescription)")
    }
}

In the above extension we are checking with our guard let statement to see if we have any credentials. Usually we would do something with the users information but in this case we are just going to print our user email to the console. Lastly we create a function to handle the error in case something goes wrong. We will also print out an error to the console for this example but in a real project you would want to handle the error to the user with some kind of alert view.

Lastly we need to present our **ASAuthorizationController** by adding another extension to **ViewController**.

extension ViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}

This allows us to present the **ASAuthorizationController** over our app.

Our final code should look like the example below.

import UIKit
import AuthenticationServices

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSignInWithAppleButton()
        
    }

    func configureSignInWithAppleButton() {
        
        // Create sign in button
        let signInButton = ASAuthorizationAppleIDButton()
        
        //Add to view
        self.view.addSubview(signInButton)
        
        // Function for the action of our button
        signInButton.addTarget(self, action: #selector(ViewController.signInButtonTapped), for: .touchDown)
        
        // Remove constraints so we can add them programmatically
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Added button constraints
        NSLayoutConstraint.activate(\[
            signInButton.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 1),
            signInButton.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 1),
            signInButton.heightAnchor.constraint(equalToConstant: 40),
            signInButton.widthAnchor.constraint(equalToConstant: 200)
        \])
    }

    @objc private func signInButtonTapped() {
        let authorizationProvider = ASAuthorizationAppleIDProvider()
        let request = authorizationProvider.createRequest()
        request.requestedScopes = \[.email\]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: \[request\])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
}

extension ViewController: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential else {
            return
        }
        
        print("AppleID Credential Authorization: userId: \\(appleIDCredential.user), email: \\(String(describing: appleIDCredential.email))")
        
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("AppleID Credential failed with error: \\(error.localizedDescription)")
    }
}

extension ViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}

Remember that we can only test for Sign in with Apple on a physical device and not in the Xcode simulator.

That's all there is to adding Sign in with Apple to your swift project.

I hope this post helps make it easy for your user to login to your app!

📱💻👨🏻‍💻Happy coding! 👨🏻‍💻💻📱
