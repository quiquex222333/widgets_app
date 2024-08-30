import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Hello world"),
        action: SnackBarAction(label: "OK!", onPressed: () {}),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("Sure?"),
        content: const Text(
            "Reprehenderit pariatur aliquip enim eiusmod Lorem tempor amet qui esse duis commodo duis. Anim aute in enim anim nisi id ea fugiat reprehenderit veniam deserunt fugiat deserunt. Est qui dolor incididunt proident eu duis nulla esse proident occaecat commodo esse qui labore. Voluptate adipisicing id sint Lorem incididunt. Est amet sunt labore incididunt fugiat ipsum proident fugiat ipsum culpa."),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text("Cancel"),
          ),
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text("Aceept"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbars and Dialogs"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text("Show Snackbar"),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text(
                        "Sint voluptate laborum eu esse cupidatat ipsum minim est consectetur mollit. Cupidatat laboris aute sit deserunt. Qui est velit duis velit sint labore ut laboris tempor cupidatat eu do esse. Elit ut cillum velit do irure mollit duis enim nisi nulla dolore. Aliquip aute pariatur dolor consequat culpa id ut consectetur esse.")
                  ],
                );
              },
              child: const Text("Used licencies"),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text("Show Dialog"),
            ),
          ],
        ),
      ),
    );
  }
}
