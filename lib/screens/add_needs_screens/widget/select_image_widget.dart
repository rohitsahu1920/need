import 'dart:io';

import 'package:flutter/material.dart';

class SelectImagesWidget extends StatelessWidget {
  String title;
  Function onTap;
  String imagePath;

  SelectImagesWidget(
      {required this.title,
      required this.onTap,
      required this.imagePath,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          GestureDetector(
            onTap: () => onTap(),
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: imagePath.isNotEmpty
                            ? Image.file(File(imagePath))
                            : Icon(
                                Icons.add_a_photo_rounded,
                                size: 32,
                                color: Colors.black,
                              ),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => onTap(),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                title,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
