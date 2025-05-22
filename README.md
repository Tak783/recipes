# Recipes
* Project presents a simple client to display recipes using The Guardian API: https://open-platform.theguardian.com/ 
* Improvements to the codebase can be found in the "Improvements" section at the bottom of the README
* Discussion on Architecture, decisions and how to navigate the app can be found below 
* See the "Warning" section for guidance before running the app

## Overview 

### Architecture 
* App is built on top of multiple platform-agnostic frameworks that exist inside their own projects split into layers. Reasoning and design are discussed in the sections below
* Each layer project(framework) can be built and be tested on its own including the Presentation Layer Application targets.
* There are four layers: `Foundation Layer`, `Core Shared Components`, `Feature Layer` and the `Presentation Layer` (Presentation Layer)
* Layers dependencies are used vertically: each module can import only from layers below 

<img width="1277" alt="README-Architecture" src="https://github.com/user-attachments/assets/cf31758a-86b4-4cfb-a04d-e9ef91a782d3">

### Platform Agnostic Components (Reasoning)
Every layer that exists below the presentation layer is built with platform-agnostic components for the following reasons.
* Easily use in Mac, iOS, iPadOS, Watch OS apps using either UIKit, WatchKit or SwiftUI
* Highly *reusable* components that can easily be used to support other feature layer components and Presentation Layer Application targets
* Faster *build times* for tests, testing suites and projects locally and on pipelines. 
* Easier *collaboration* between teams (everything does not happen in one place)
* Easily use new technologies i.e. SwiftUI or Combine
* Applied Engineering business organisation considerations for *open-sourcing* capability, *hiring* and *demo apps* as layer components are independently relying on abstractions rather than concrete implementation. It is also very easy to bring on new technologies such as SwiftUI.

### Design and Development (Discussion) 
* Built applying SOLID principles with a relatively extensive Unit and Integration testing suite.
* App Built in a TDD way, ensuring that functionality works as expected and also providing protection from regressions 
* More UI, Unit and Integrations could have been added as discussed in the improvments section  
* Business and engineering organisations considerations were made when constructing this project as discussed in the previous section.

## Architectural decisions 

### Layers (overview)
* As seen in the overview, the app has four layers: `Foundation Layer`, `Core Shared Components`, `Feature Layer` and the `Presentation Layer`
* Each module lives in its own independent project with as few dependencies as possible, contains its own tests, this way each feature can be
   *  Built-in isolation without building the entire Presentation Layer App 
   *  Be highly reusable, open sourceable and able to be used in demo apps
   *  Be platform agnostic usable in any presentation application target platform
* Vertical dependencies: each layer contains modules used as dependencies by higher-level modules. Modules can import only from the layers below. 

### `Foundation Layer` (explained)
Contains foundational shared frameworks to be shared across multiple presentation layer app targets i.e. iPhone, iPad for business and retail users. The layer contains the following modules; 
* `CoreFoundational`: contains extensions to the `Foundation` framework. These are used across Feature frameworks and the app. 

### `Foundation Layer` (explained)
These are shared components that make use of the "Utilities" layer to provide Core Shared functionality i.e. Networking, Local Persistance, Keychain access. The layer contains the following modules;
* `CoreNetworking`: contains the networking layer and the `MockNetworking` framework which supports Testing Suites across the Project when testing Network calls. 

### Feature Layer (explained)
Contains modules containing features used in Presentation Application Targets. The layer contains the following modules;
* `RecipesFeature`: Feature to show the recipe feed module has an API, Service and Presentation Layer

### Application Target Presentation Layer (explained)
`Presentation Layer`: Where apps Mac, iOS, iPadOS, Watch OS use the feature frameworks and other level components to present features for users
* `RecipesClient`: A simple client to display recipes using The Guardian API: https://open-platform.theguardian.com/ 
  * Uses coordinators for navigation + composers for creation of views   
* Other apps such as CookAssistantiOS or CalorieTrackeriOS could be built to re-use higher level layers 

## How to navigate the project 
As discussed above, the overall project has multiple layers. Dive in.
1. You can easily see how all of this works by opening `*/Recipes.xcworkspace`. Dependencies can be found in the workspace
2. If you just want to see the iOS target navigate to `RecipesClient/RecipesClient.xcodeproj`
3. To make either project work add your guardian API Key in `SceneDelegate`(register one here: https://bonobo.capi.gutools.co.uk/register/developer).
4. Run the app

The layer dependencies can be run and tested independently. They exist in the following locations
1. `Foundation Layer/*` for shared Core utilities 
2. `Feature Layer/*` for shared Feature utilities 
3. `RecipesClient/*` for the recipes app

### Warnings  
* As discussed you may need to add your own API Key into the app (register one here: https://bonobo.capi.gutools.co.uk/register/developer).
* Add your API key to `AuthenticationStore` 

## Improvements 
There are many optimisations and improvements to be made across the project across the presentation App and Targets (open to discuss), but the following are some of the core changes I'd like to make.

* Add Unit tests tests for the services
* Add Unit and Integration tests to the View Model
* UI test the feed feature 
* Move SwiftUI presentation code for features i.e. `Recipe` into a package called `RecipesFeatureUI` to make re-usable for other apps
* Move coordinator into a package called `CoreNavigation` so it can be used by other apps or for when UI features end up in their own package  
* Move re-usable UI componets i.e. `ErrorView` into a package called `CoreRecipesSwiftUIComponents`
* Do all the usual things i.e. Localisation, Accessibility additions, a Design System
* Guardian API Layer: If we end up using the guardian API for multiple features, I would add an API layer strictly used for interfacing with the Guardian API when creating URL requests. This API would sit above the Utility Layers and Below the Feature Layers.
