# step_tracker plugin

A Flutter step_tracker plugin is collect information from user and display progress through a sequence of steps. this plugin also have privilege for fully customization from user side.

## Usage

#### Add dependency

Please check the latest version before installation. If there is any problem with the new version, please use the previous version.

```yaml
dependencies:
  flutter:
    sdk: flutter
  # add step_tracker
  step_tracker: ^{latest version}
```

#### Add the following imports to your Dart code

```dart
import 'package:step_tracker/step_tracker.dart';
```

#### How to use
Simply create a ```step_tracker``` widget, and pass the required params and List of ```steps[]```:

```dart
StepTracker(
  dotSize: 10,
  circleIconSize: 24,
  showIcon: true,
  selectedColor: Colors.green,
  unSelectedColor: Colors.red,
  stepTrackerType: StepTrackerType.dotVertical,
  pipeSize: 30,
  steps: [
    Steps(title: Text("your text"), state: TrackerState.none),
    Steps(title: Text("your text"), state: TrackerState.complete),
    Steps(title: Text("your text"), state: TrackerState.disabled),
  ],
)
```

##### Change tracker state
Here we have three state on Steps Widget ```complete``` ```disabled``` and one more is ```none``` which is default set. Following attributes are below:

```dart
state: TrackerState.none
state: TrackerState.complete
state: TrackerState.disable
```
<img src="https://github.com/Roshannahak/step_tracker/blob/main/screenshots/s1.jpg?raw=true" width="200"/>  <img src="https://github.com/Roshannahak/step_tracker/blob/main/screenshots/s4.jpg?raw=true" width="200"/>

##### Types of tracker
In this widget, currently we have two types of tracker ```indexedVertical``` & ```dotVertical```, default set is ```dotVertical```.

```dart
stepTrackerType: StepTrackerType.indexedVertical
stepTrackerType: StepTrackerType.dotVertical
stepTrackerType: StepTrackerType.indexedHorizontal
StepTrackerType.dotHorizontal
```
<img src="https://github.com/Roshannahak/step_tracker/blob/main/screenshots/s2.jpg?raw=true" width="200"/>  <img src="https://github.com/Roshannahak/step_tracker/blob/main/screenshots/s3.jpg?raw=true" width="200"/> <img src="https://github.com/Roshannahak/step_tracker/blob/dev/screenshots/s5.png?raw=true" width="200"/>

##### Icon Stepper Guide
To use the icon stepper with `StepTrackerType.indexedVertical` and `StepTrackerType.indexedHorizontal`:

- Set `showIcon: true`
- Provide the image URL in the `iconAsset` property of `Steps`

```dart
StepTracker(
  type: StepTrackerType.indexedVertical,
  showIcon: true,
  circleIconSize: 24;
  steps: [
    Steps(title: "Order Placed", iconAsset: "assets/step1.png"),
    Steps(title: "Shipped", iconAsset: "assets/step2.png"),
    Steps(title: "Delivered", iconAsset: "assets/step3.png"),
  ],
)
```
<img src="https://github.com/Roshannahak/step_tracker/blob/dev/screenshots/s6.png?raw=true" width="200"/> <img src="https://github.com/Roshannahak/step_tracker/blob/dev/screenshots/s7.png?raw=true" width="200"/> <img src="https://github.com/Roshannahak/step_tracker/blob/dev/screenshots/s8.png?raw=true" width="200"/>

#### Feedback
* Please raise an issue <a href = "https://github.com/Roshannahak/step_tracker/issues">here</a>.
* For more information please connect with me.

#### Contect with me
<a href="https://github.com/Roshannahak"><img src= "https://img.icons8.com/ios-glyphs/344/github.png" width = "40px"/></a> <a href="https://www.linkedin.com/in/roshan-nahak-a15833193"><img src= "https://img.icons8.com/color/344/linkedin.png" width = "40px"/></a> <a href="mailto:roshannahakofficial@gmail.com"><img src= "https://img.icons8.com/color/344/gmail-new.png" width = "40px"/></a> <a href="https://www.facebook.com/roshan.nahak.16/"><img src= "https://img.icons8.com/color/344/facebook-new.png" width = "40px"/></a>

