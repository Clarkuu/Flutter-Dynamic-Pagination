import 'package:flutter/material.dart';

class Pagination extends StatefulWidget {
  final int pageSize;
  final int postNumber;
  final Function(int) onPressed;
  final Color? buttonColor;

  const Pagination({
    Key? key, // Fix the super.key parameter
    required this.pageSize,
    required this.postNumber,
    required this.onPressed,
    this.buttonColor,
  });

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  int pageIndex = 0;
  List<int> numbers = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    int pageNumberAsInt = (widget.postNumber / widget.pageSize).ceil();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (numbers[0] != 1)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      numbers = numbers
                          .map((number) => number -= 1)
                          .cast<int>()
                          .toList();
                    });
                  },
                  child: const Icon(
                    Icons.chevron_left,
                    size: 24.0,
                    color: widget.buttonColor ?? Colors.blue,
                  ),
                ),
              for (int i = 0; i < pageNumberAsInt && i < numbers.length; i++)
                ElevatedButton(
                  onPressed: () => widget.onPressed(i),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        widget.buttonColor ??
                            Colors.blue), // Button background color
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(color: Colors.white)), // Text color
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Button border radius
                    )),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
                    minimumSize: MaterialStateProperty.all(
                      const Size(
                          30.0, 36.0), // Change the width (100.0) as needed
                    ), // Button content padding
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                        5.0), // Padding around the button content
                    child: Text(
                      numbers[i].toString(),
                    ),
                  ),
                ),
              if (pageNumberAsInt >= 5 && pageNumberAsInt > numbers[4])
                GestureDetector(
                  onTap: () {
                    setState(() {
                      numbers = numbers
                          .map((number) => number += 1)
                          .cast<int>()
                          .toList();
                    });
                  },
                  child: const Icon(
                    Icons.chevron_right,
                    size: 24.0,
                    color: widget.buttonColor ?? Colors.blue,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
