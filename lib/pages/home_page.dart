import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomb_stone/components/task_tile.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:tomb_stone/pages/login_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  final ScrollController _scrollController = ScrollController();

  double offset = 0;

  @override
  void initState() {
    // The line 'super.initState();' calls the parent's (State) initState method,
    // which is required to properly initialize the widget's state.
    // It ensures that any initialization logic in the parent class is executed.
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        offset = _scrollController.offset;
      });
    });
  }

  //logout button
  void logOutUser() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffffbff),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _addTaskButton(),
        // floatingActionButton: FloatingActionButton(onPressed: logOutUser),
      
        // Date , month , day
        body: SafeArea(
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                expandedHeight: 350,
                backgroundColor: Colors.lime,
                flexibleSpace: FlexibleSpaceBar(
                  background: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32.0,
                        vertical: 20.0,
                      ),
                      child: _header(),
                    ),
                  ),
                ),
              ),
              // SliverToBoxAdapter(child: Container(height: 300, color: Colors.black)),
              SliverToBoxAdapter(child: SizedBox(height: 15)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 16.0,
                ),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    TaskTile(name: 'Wake Up', time: '09:00'),
                    SizedBox(height: 20),
                    TaskTile(name: 'Design Crit', time: '09:00'),
                    SizedBox(height: 20),
                    TaskTile(name: 'Haircut', time: '09:00'),
                    SizedBox(height: 20),
                    TaskTile(name: 'Birthday Party', time: '09:00'),
                    SizedBox(height: 20),
                    TaskTile(name: 'Finish designs', time: '09:00'),
                    SizedBox(height: 20),
                    TaskTile(name: 'Make Pasta', time: '09:00'),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _addTaskButton() {
    return SizedBox(
      width: 76,
      height: 54,
      child: FloatingActionButton(
        onPressed: () {},
        foregroundColor: Colors.black,
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.grey.shade700,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Row _header() {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween, // push left and right blocks to edges
      crossAxisAlignment: CrossAxisAlignment.start, // align tops
      children: [
        // Left block: big number + small red dot
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '09',
              style: GoogleFonts.inter(
                fontSize: 70,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8),

            Container(
              margin: EdgeInsets.only(top: 38),
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            ),
          ],
        ),

        // Right block: month + weekday (right-aligned and top)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Jan'24",
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  height: 1,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 2),
              Text(
                "Tuesday",
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  height: 1,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
