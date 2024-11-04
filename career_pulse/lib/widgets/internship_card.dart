import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:career_pulse/saved_internships_state.dart';
import 'package:career_pulse/widgets/job_popup.dart';

class InternshipCard extends StatefulWidget {
  final String title;
  final String company;
  final String role;
  final String location; // Add location
  final String datePosted; // Add datePosted
  final String daysAgo; // Add daysAgo
  final VoidCallback onTap;

  const InternshipCard({
    super.key,
    required this.title,
    required this.company,
    required this.role,
    required this.location, // Initialize location
    required this.datePosted, // Initialize datePosted
    required this.daysAgo, // Initialize daysAgo
    required this.onTap,
  });

  get jobUrl => null;

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
      'daysAgo': widget.daysAgo,
    });

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return JobPopup(
                companyName: widget.company,
                roleTitle: widget.role,
                location: widget.location,
                datePosted: widget.datePosted,
                daysAgo: widget.daysAgo,
                jobUrl: 'https://www.linkedin.com/jobs/',
              );
            },
          );
        },
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              widget.company.substring(0, 1),
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
                  'daysAgo': widget.daysAgo,
                });
              } else {
                savedInternshipsState.addSavedInternship({
                  'title': widget.title,
                  'company': widget.company,
                  'daysAgo': widget.daysAgo,
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
