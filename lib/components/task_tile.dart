import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskTile extends StatefulWidget {
  final String name;
  final String time;

  TaskTile({super.key, required this.name, required this.time});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool _checkbox = false;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Transform.translate(
      offset: Offset(-10, 0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.transparent,
                  activeColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ), // Adjust radius as needed
                  ),
                  value: _checkbox,
                  onChanged: (bool? value) {
                    setState(() {
                      _checkbox = value!;
                    });
                  },
                ),
                Text(
                  widget.name,
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
      
            Text(
              widget.time,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
