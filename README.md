# switcher_button

Switcher button.
Flutter switch button with minimal design and material animation and highly
customizable.It can be use as switch button or toggle buttons.




https://github.com/SanterDev1/sweep_animation_button/assets/136260769/5ddc5007-5ee9-4998-a879-348ea72481f3



| Property | Description |
| --- | --- |
| `size` | Size of widget, width of widget is equal size and height of widget is equal size / 2|
| `onColor` | onColor is color of widget when it's on |
| `offColor` | offColor is color of widget when it's off |
| `value` | initial value of widget if true widget switch on else widget switch off |
| `onChange` | When user tap on switch button and change state of widget onChange will call and pass current state of widget  |



Usage
-----

```dart
SwitcherButton(
    value: true,
    onChange: (value) {
      print(value);
    },
  )
```
thanks to https://dribbble.com/katelaguta for nice design.
