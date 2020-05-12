# Marvel Heroes App: iOS Code Challenge

[![Xcode 11.4.1](https://img.shields.io/badge/Xcode-11.4.1-2394F4)](https://developer.apple.com/xcode/)
[![Swift 5.2](https://img.shields.io/badge/Swift-5.2-F05138)](https://developer.apple.com/swift/)
[![SwiftUI](https://img.shields.io/badge/User%20Interface-SwiftUI-00C9F0)](https://developer.apple.com/xcode/swiftui/)
[![iOS Min Target 13.0](https://img.shields.io/badge/iOS%20Min%20Target-13.0-8e8e93)](https://developer.apple.com/ios/)
[![MIT license](https://img.shields.io/badge/License-MIT-green)](http://alemohamad.mit-license.org/)

## Functional Requirements

* Create an iOS application that communicates with the Public Marvel API: [https://developer.marvel.com](https://developer.marvel.com)
* The app should consist on a list of heroes. There should be a searching mechanism in order to filter the heroes by name that starts with specified characters. For example “Sp” should return “Spider-Man” among others.
* The data shown for each hero is up to you, but the app should present at least this info for each hero: name, description, picture
* When the user taps on a hero, the app should present a list with all the hero’s comics. This list should at least present the following info for each comic: title, description, image.
* For this interface selecting one of the comics should present extended info of the selected comic. The amount of info and how to present it is up to you.

## Technical Requirements

* Use Swift 4 or Swift 5 to develop the entire app.
* Follow the architecture you think is appropriate for this application.
* Feel free to use any 3rd party libraries.
* Please use git so we can see a little of your working methods. You can share this repository with us using GitHub, BitBucket, or simply a .zip file with the .git folder included.
* Include a README explaining the architecture you followed and some of the decisions made.

------------------------

## Structure of the Project

For the architecture of the app I used a version of **MVC** design patter, adapted to the communication architecture that **SwiftUI** offers. I used the `CharacterObject` class to manage the **Marvel API** response as an `ObservedObject`, and a struct `Endpoint` to be able to generate the URL of each endpoint along with the parameters it has to send in each request.

I made the decision to use mostly Apple's own APIs, and only integrated the [URLImage](https://github.com/dmytro-anokhin/url-image) library through the **Swift Package Manager** in **Xcode**.

This project uses MVC design pattern. This project has a layer of Network that handels the requests to Marvel API.

**Note:** In order to use the app, please replace in `MarvelConfig.xcconfig` the value of the Public and Private API keys with valid Marvel API keys.

```
MARVEL_API_KEY = key
MARVEL_PRIVATE_KEY = key
```

### Some things that you can find in this app

* Separated network layer
* Works on portrait and landscape
* Supports both iPhone and iPad devices
* Dark and Ligt mode for iOS 13

### Why I chose SwiftUI over UIKit?

The **SwiftUI framework** is fairly new, and right now it is the platform that Apple is promoting [since last year's WWDC conference](https://developer.apple.com/wwdc19/) to be adopted. Although it has some issues, the best way to help them fix it is adopting it by developers and companies in order for that to be part of millions of apps on the **App Store**.

SwiftUI promotes a **minimalist approach** aimed for quickly prototypes and obtain results. Everything can be divided into smaller parts.

Also, its goal is not to replace **UIKit**, since the two frameworks can be mixed using protocols like `UIViewControllerRepresentable`. In this way, if we are working on a project that has already started, SwiftUI can be integrated into a UIKit project.

And if we talk about the discussion that occurs in the iOS development world, between whether we implement the User Interface with Interface Builder visually (which brings issues with dev teams) or if we implement it only through code (something that is actually not so nice to do with UIKit). And not to mention that we don't have to deal with AutoLayout or the like.

If we think about integration, SwiftUI was created thinking about integrating it with the different systems of the Apple platforms, such as **CoreData** or **Dark mode** (among others). And taking into account that with the same code structure we can have our project ready so that it not only works on **iOS** and **iPadOS**, but also on **watchOS**, **tvOS** and **macOS**. *This is huge!*

Another issue that *may* draw attention is that SwiftUI can currently be implemented in applications that support **iOS 13** onwards. In the market there is an idea that older versions must be supported. But looking at the adoption rate of iOS in [the official statistics of the App Store](https://developer.apple.com/support/app-store/), we can see that **more than 70% of devices worldwide** use iOS 13. It is important to pay attention to the business itself and to know the users who make the application have an income, but I also think that it's important to be up-to-date with the technology that Apple offers every year, so we can offer better products optimized for the platform.

On the other hand, we are almost one month away from [WWDC 2020](https://developer.apple.com/wwdc20/), in which Apple will surely present something similar to a **version 2.0** of SwiftUI, and together with **iOS 14** we would already be supporting what the market sees as ideal, which is the current and previous version of iOS.

**I personally believe that this is the time to invest in SwiftUI for both independent and enterprise products.**

## App preview

<img src="https://github.com/alemohamad/marvel-heroes-ios-code-challenge/blob/master/marvel-ios-app.gif?raw=true" width="200">

## Some things I'd like to add to the app

* A loading/activity indicator to notify the user when data is being read.
* Verify Internet connectivity in order for the app to work properly (reachability).
* Add a custom design to make the experience more enjoyable and not just the base design of iOS.
* Unit and UI testing

## About Me

I have 20 years of experience in several software development fields. Specifically I have 5 years of experience on the **Apple iOS** platform, coding with **Swift**, implementing custom designs with **SwiftUI**, **UIKit** and **Storyboards**, and connecting apps to web services, including Open Source libraries with **Swift Package Manager**, **CocoaPods**. I use **TestFlight** to distribute beta version in development, and I have experience publishing to the **App Store**.

I also have knowledge of design tools like **Sketch**, **Figma** and **Zeplin** to handle the delivered designs. In this regard, I’m knowledgeable on the UI/UX paradigms and I like proposing ideas to create a better product at the end of the day.

* [App Store](https://itunes.apple.com/developer/ale-mohamad/id569018219?mt=8)
* [LinkedIn](https://www.linkedin.com/in/alemohamad/)
* [GitHub](https://github.com/alemohamad)
