# NavigationManager
Swift navigation manager class implementation that has an easy to use protocol for presenting view controllers

Presenter Protocol Usage (Implemented by a view controller that uses it):
``` 
//Shows modal view controller (using enum mapped to a viewcontroller identifier specified in NavigationManager.swift)
//Has a completion handler for after the modal has loaded
showModalViewController(.Red, completionHandler: { print("Showing Red") })

//Sets the root controller on the navigation stack
setNewRootViewController(.Blue)

//Replaces the last item on the navigation stack
replaceViewController(.Red)

//Pushes a new view controller onto the navigation stack
showAnotherViewController(.Black)


```


