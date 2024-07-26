import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../saved_internships_state.dart';

class InternshipCard extends StatefulWidget {
  final String title;
  final String company;
  final String role;
  final VoidCallback onTap;

  const InternshipCard({
    super.key,
    required this.title,
    required this.company,
    required this.role,
    required this.onTap,
  });

  @override
  InternshipCardState createState() => InternshipCardState();
}

class InternshipCardState extends State<InternshipCard> {
  @override
  Widget build(BuildContext context) {
    final savedInternshipsState = Provider.of<SavedInternshipsState>(context);
    final isBookmarked = savedInternshipsState.isInternshipSaved({
      'title': widget.title,
      'company': widget.company,
      'role': widget.role,
    });

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: widget.onTap,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              widget.title.substring(0, 1),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: Text(widget.title),
          subtitle: Text("${widget.company} | ${widget.role}"),
          trailing: IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: isBookmarked ? Colors.black : null,
            ),
            onPressed: () {
              if (isBookmarked) {
                savedInternshipsState.removeSavedInternship({
                  'title': widget.title,
                  'company': widget.company,
                  'role': widget.role,
                });
              } else {
                savedInternshipsState.addSavedInternship({
                  'title': widget.title,
                  'company': widget.company,
                  'role': widget.role,
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
