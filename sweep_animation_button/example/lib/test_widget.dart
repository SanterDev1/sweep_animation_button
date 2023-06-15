import 'package:flutter/material.dart';
import 'package:sweep_animation_button/sweep_animation_button.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool visibility = false;
  bool isAnimation = true;
  bool isDone = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      body: Center(
        child: Container(
          width: size.width * 0.7,
          height: size.height * 0.5,
          color: Colors.lightGreen[200],
          child: Stack(
            alignment: Alignment.center,
            children: [
              buildButtonWidget(),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 600),
                top: isAnimation ? -700 : 0,
                child: Container(
                  width: size.width * 0.7,
                  height: size.height * 0.5,
                  color: Colors.lightGreen[300],
                  child: Column(
                    children: [
                      buildRowWidget(),
                      const SizedBox(height: 24),
                      buildColumnInputWidget(),
                      const SizedBox(height: 24),
                      buildCheckBox(),
                      const SizedBox(height: 24),
                      buildMyWidgetSweeped(),
                    ],
                  ),
                ),
              ),
              buildDoneLogin(
                  width: size.width * 0.7, height: size.height * 0.5),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButtonWidget() {
    return InkWell(
      onTap: () => setState(() => isAnimation = !isAnimation),
      borderRadius: BorderRadius.circular(50),
      child: Container(
        alignment: Alignment.center,
        width: 135,
        height: 35,
        decoration: BoxDecoration(
          color: Colors.lightGreen[300],
          border: Border.all(color: Colors.green.shade300, width: 1.7),
        ),
        child: Text(
          "Show Exemple",
          style: TextStyle(
            color: Colors.green[600],
            fontSize: 13,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }

  Widget buildRowWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 20),
          Text(
            "Page Login",
            style: TextStyle(
              color: Colors.green[700],
              fontSize: 18,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
            ),
          ),
          InkWell(
            onTap: () => setState(() => isAnimation = !isAnimation),
            borderRadius: BorderRadius.circular(50),
            splashFactory: NoSplash.splashFactory,
            child: Container(
              alignment: Alignment.center,
              width: 35,
              height: 35,
              child: Icon(
                Icons.close,
                size: 22,
                color: Colors.green[700],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildColumnInputWidget() {
    return Column(
      children: [
        buildInputWidget("Entre Your Adress Email", false),
        const SizedBox(height: 12),
        buildInputWidget("Entre Your Password", true),
      ],
    );
  }

  Widget buildInputWidget(String title, bool obscureText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SizedBox(
        width: double.infinity,
        height: 45,
        child: TextFormField(
          keyboardType: null,
          obscureText: obscureText,
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 15,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.4,
          ),
          cursorColor: Colors.green[900],
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.lightGreen[400],
            hintText: title,
            hintStyle: TextStyle(
              color: Colors.green[800],
              fontSize: 13,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.4,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.lightGreen.shade600, width: 1.4),
              borderRadius: BorderRadius.circular(0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green.shade800, width: 2),
              borderRadius: BorderRadius.circular(0),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCheckBox() {
    return Row(
      children: [
        Checkbox(
          value: visibility ? true : false,
          onChanged: (value) => setState(() => visibility = !visibility),
          fillColor: MaterialStatePropertyAll(Colors.lightGreen[600]),
          checkColor: Colors.green[900],
        ),
        Text(
          "Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit. \nNullam feugiat malesuada odio .",
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
            color: Colors.green[900],
          ),
        ),
      ],
    );
  }

  Widget buildMyWidgetSweeped() {
    return SweepAnimationButton(
      width: 200,
      height: 40,
      animationProgressColor: Colors.lightGreen[500],
      borderRadius: 50,
      animationColor: Colors.lightGreen[100],
      backroundColor: Colors.green[400],
      durationCircle: 5,
      hideIcon: true,
      child: Text(
        "Log In",
        style: TextStyle(
          fontSize: 16,
          color: Colors.green[900],
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
      ),
      onTap: () => setState(() => isDone = !isDone),
    );
  }

  Widget buildDoneLogin({required double width, required double height}) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 600),
      top: isDone ? 700 : 0,
      child: Container(
        width: width,
        height: height,
        color: Colors.lightGreen[300],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.done, size: 50, color: Colors.green[600]),
            ),
          ],
        ),
      ),
    );
  }
}
