# sweep_animation_button

--------------------------------------------------------------------------------

New package enables you to create a button move with other properties to discover.

--------------------------------------------------------------------------------

## Getting Started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  sweep_animation_button: ^0.0.1
```

Import it:

```dart
import 'package:sweep_animation_button/sweep_animation_button.dart';
```
--------------------------------------------------------------------------------

## Usage Examples
--------------------------------------------------------------------------------

### Exemple 1
-----

```dart
SweepAnimationButton(
    width: 250,
    height: 50,
    animationProgressColor: Colors.green[800],
    borderRadius: 50,
    animationColor: Colors.lightGreen,
    backroundColor: Colors.lightGreen[200],
    durationCircle: 5,
    hideIcon: true,
    child: Text(
      "Sweeped Button",
      style: TextStyle(
        fontSize: 15,
        color: Colors.green[600],
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
      ),
    ),
    onTap: () {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          shape: const CircleBorder(),
          elevation: 0.4,
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.lightGreen[300],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.done,
                size: 24,
                color: Colors.lightGreen[700],
              ),
            ),
            ,
        ),
      );
    },
  ),
  
```

![Exemple_1](https://github.com/SanterDev1/sweep_animation_button/assets/136260769/fc214de8-974a-4671-bb78-617841d5c0a8)

--------------------------------------------------------------------------------

### Exemple 2
-----

```dart
SweepAnimationButton(
    width: 250,
    height: 50,
    animationProgressColor: Colors.deepPurple[100],
    borderRadius: 0,
    animationColor: Colors.deepPurple,
    backroundColor: Colors.deepPurple[200],
    durationCircle: 5,
    hideIcon: true,
    child: Text(
      "Sweeped Button",
      style: TextStyle(
        fontSize: 15,
        color: Colors.deepPurple[700],
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
      ),
    ),
    onTap: () {
      setState(() => isChanged = !isChanged);
      setState(() => visibility = false);
    },
  ),
  
```

![Exemple_2](https://github.com/SanterDev1/sweep_animation_button/assets/136260769/ae796881-ad28-411c-8a1d-5197614aa199)

--------------------------------------------------------------------------------

| Property | Description |
| --- | --- |
| `Size` | Determine the [ Height ] and [ Width ] you want . |
| `Child` | Full liberty to modify [ Widget ] text or icon. |
| `Fade icon` | Switch it on or off animation fade with icon. |
| `onTap` | After the time you set you react [ Function ] automatically . |
| `Duration` | Setting the expiry time [ CircleProgressIndicator ] . |
| `BorderRadius` | Complete freedom to choose the shape of [ Widget ] corners if you show them sharp corners put number [ 0 ] or circular [ 100 ] . |
| `Color` | Free to choose [ Color ] whether [ Backround ] or [ Color Sweeped ] . |

--------------------------------------------------------------------------------

Your Profile https://github.com/SanterDev1 Thanks to everybody .
