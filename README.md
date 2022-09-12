## step_tracker plugin

The step_tracker widgets help you to show or collect information from users using organized steps.

### Usage

```yaml
dependencies:
  flutter:
    sdk: flutter
  # add step_tracker
  step_tracker: ^{latest version}
```

```dart
import 'package:step_tracker/step_tracker.dart';
```

```dart
StepTracker(
    stepTrackerType: StepTrackerType.indexedVertical,
    steps: [
        Steps(title: Text("Order Placed"), state: TrackerState.complete),
        Steps(title: Text("Shipped"), state: TrackerState.complete),
        Steps(title: Text("Out of delivery"), state: TrackerState.disabled),
        Steps(title: Text("Deliverd"), state: TrackerState.disabled),
    ],
)
```
