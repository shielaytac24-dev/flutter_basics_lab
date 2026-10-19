# ANSWERS

## 1. GitHub Repository Link

https://github.com/shielaytac24-dev/flutter_basics_lab

## 2. Last Three `build()` Called Lines from Activity 2

1. `build() called: 4 glasses`
2. `build() called: 5 glasses`
3. `build() called: 6 glasses`



## 3. Observations from Experiments

### Activity 2: Water Tracker

I observed that the water tracker updates the number of glasses when I press the add or remove button. The `build()` method is called again when the state changes through `setState()`. When the count reaches the goal of 6 glasses, the app displays a message saying that the goal has been reached. The Debug Console helps me observe when the widget rebuilds.

When I changed the `_glasses` variable outside `setState()`, the interface did not automatically update because Flutter was not notified to rebuild the widget.

### Activity 3: Weather Dashboard

I observed that `Row` arranges widgets horizontally, while `Column` arranges them vertically. `Expanded` helps widgets share the available space. When I removed `Expanded` from a `StatBox`, the layout could become too wide and cause an overflow. I restored `Expanded` after observing the result.

I also added a fourth `StatBox` using `Icons.thermostat`, with the label `Feels like` and the value `35°`. The four stat boxes help display the weather information in an organized layout.

### Activity 5: Settings Page

I observed that `ThemeData` applies consistent colors and styles throughout the application. When I turned on dark mode, the app changed to a dark theme. Turning it off returned the app to light mode.

I added another skill chip and changed the button corner radius in `buildTheme()` from 8 to 20. The buttons became more rounded. I also observed that pressing the Save button displays a SnackBar at the bottom of the screen.

## 4. Review Questions

### 1. What is the difference between a StatelessWidget and a StatefulWidget? Give one example of each from this lab.

A `StatelessWidget` does not manage changing state within itself. Its appearance depends on the values it receives. An example from this lab is the `ProfileCard` in Activity 1. A `StatefulWidget` can update its interface when its state changes. An example is the water tracker in Activity 2.

### 2. Why is a StatefulWidget written as two classes? What does each class do?

A `StatefulWidget` uses two classes because they have different responsibilities. The widget class defines the widget and creates its state object using `createState()`. The `State` class stores the changing data and contains the `build()` method that displays the interface.

### 3. In Activity 2, what happened when you changed `_glasses` outside `setState()`? Why?

The value of `_glasses` changed, but the interface did not automatically update. This happened because changing a variable outside `setState()` does not notify Flutter that the widget needs to rebuild.

### 4. Looking at the Debug Console in Activity 2, when is `build()` called?

The Debug Console shows that `build()` is called when the widget is first built and again when `setState()` triggers a rebuild. In the water tracker, pressing the add or remove button changes the state and causes Flutter to call `build()` again.

### 5. Explain the main axis and the cross axis of a Row and of a Column.

In a `Row`, the main axis is horizontal and the cross axis is vertical. In a `Column`, the main axis is vertical and the cross axis is horizontal. These axes determine how widgets are arranged and aligned.

### 6. In Activity 3, what happened when you removed Expanded from a StatBox? What does Expanded do?

When I removed `Expanded` from a `StatBox`, the layout could become too wide and cause an overflow. `Expanded` makes a child take up its share of the available space along the main axis.

### 7. Why do we use GridView.builder for the menu instead of a Column with many children?

`GridView.builder` displays menu items in a grid and allows the items to scroll. It creates items as needed, which is useful when displaying many items. A `Column` with many children does not provide the same grid layout or built-in scrolling behavior by itself.

### 8. How do Stack and Positioned create the Best seller badge in Activity 4?

`Stack` allows widgets to overlap each other. `Positioned` places the Best seller badge at a specific location on top of the menu card. In the lab code, the badge is positioned near the upper-left corner using `top: 8` and `left: 8`.

### 9. What is the difference between customizing with ThemeData and with a style on one widget? Give one example of each from Activity 5.

`ThemeData` applies common colors and styles throughout the application. In Activity 5, `buildTheme()` defines the app's color scheme and button styling. A style applied to an individual widget affects only that widget, such as changing the corner radius of the elevated buttons.

### 10. When you flip the dark-mode switch in Activity 5, which widget holds the state, and how does the change reach MaterialApp?

The `_ThemeDemoAppState` class holds the dark-mode value in `_isDark`. When the switch changes, the `_setDark()` method calls `setState()` to update the value. The updated value determines whether `MaterialApp` uses `ThemeMode.light` or `ThemeMode.dark`, causing the app to rebuild with the selected theme.