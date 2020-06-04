<img height='175' src="https://static.openfoodfacts.org/images/misc/openfoodfacts-logo-en-178x150.png" align="left" hspace="1" vspace="1">

# Baby Eats Food Readme

## What is Baby Eats Food?

### Help translate Open Food Facts in your language

## Features

- [x] Offline barcode scanning
- [x] Product search
- [x] Allergen alert
- [x] Product details
- [x] Image upload
- [x] Handle multilingual products (view)
- [x] Handle multilingual products (data addition)
- [x] On-the-fly OCR of ingredients and labels for new product addition
- [x] Internationalised user interface
- [x] Native editing
- [x] Product addition
- [x] Night mode

## What can I work on ?

### Priority roadmap

### Secondary roadmap

### Issues
Here are issues and feature requests you can work on:
## Images

## Building

### Automatic setup
The easiest way to setup the dependencies of the project and generate the Xcode project is to run `sh scripts/setup.sh` from the top of the repository.

### Manual setup
If you prefer to not use the `sh scripts/setup.sh` script and install the dependencies yourself, follow the instructions below.

We use Carthage for dependency management.

Run `carthage bootstrap --platform iOS --cache-builds` before opening the project in Xcode.

You can install [Carthage](https://github.com/Carthage/Carthage) with Homebrew:
```
brew install carthage
```

To generate the Xcode project run `xcodegen`. For more see [XcodeGen](https://www.github.com/yonaskolb/XcodeGen).

#### Carthage resources
New to Carthage? Others have found the following resources helpful:
* [Ray Wenderlich's Carthage Tutorial](https://www.raywenderlich.com/416-carthage-tutorial-getting-started)
* [Chris Mendez's Carthage cheat sheet](https://www.chrisjmendez.com/2016/10/30/carthage-cheat-sheet/)
  
#### Generating screenshots

TODO 

### SwiftLint

We have a script that runs when building the app, it executes SwiftLint to enforce a style and conventions to the code.

You can install [SwiftLint](https://github.com/realm/SwiftLint/) with Homebrew:
```
brew install swiftlint
```

## Support

OpenFoodFacts has a Slack team where we chat, discuss and support each other, join the #iOS and #iOS-alerts channels. [Click here to join.](https://slack.openfoodfacts.org/)
