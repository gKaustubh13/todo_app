import 'package:flutter/material.dart';

class FullScreenLoaderWidget extends StatelessWidget {
  const FullScreenLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        alignment: Alignment.center,
        color: Color(0xCC000000),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              width: 16,
            ),
            Text("Saving",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white)),
          ],
        )),
      ),
    );
  }
}
