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
  selectedColor: Colors.green,
  unSelectedColor: Colors.red,
  stepHeight: 30,
  steps: [
    Steps(title: Text("your text")),
    Steps(title: Text("your text")),
    Steps(title: Text("your text")),
    Steps(title: Text("your text")),
  ],
)
```

##### Change tracker state
here we have three state on Steps Widget ```complete``` ```disabled``` and one more is set default state ```none```, following attribute is below:

```dart
state: TrackerState.none
state: TrackerState.complete
state: TrackerState.disable
```

##### Types of tracker
In this widget currently have two types of tracker ```indexedVertical``` ```dotVertical```, default set ```dorVertical```.

```dart
stepTrackerType: StepTrackerType.dotVertical
stepTrackerType: StepTrackerType.indexedVertical
```

#### Feedback
* Please raise an issue <a href = "https://github.com/Roshannahak/step_tracker/issues">here</a>.
* For more information please connect with me.

#### Contect with me
<a href="https://github.com/Roshannahak"><img src= "https://img.icons8.com/ios-glyphs/344/github.png" width = "40px"/></a> <a href="https://www.linkedin.com/in/roshan-nahak-a15833193"><img src= "https://img.icons8.com/color/344/linkedin.png" width = "40px"/></a> <a href="mailto:roshannahakofficial@gmail.com"><img src= "https://img.icons8.com/color/344/gmail-new.png" width = "40px"/></a> <a href="https://www.facebook.com/roshan.nahak.16/"><img src= "https://img.icons8.com/color/344/facebook-new.png" width = "40px"/></a>

