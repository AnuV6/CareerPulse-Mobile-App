import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:career_pulse/saved_internships_state.dart';
import 'package:career_pulse/widgets/job_popup.dart';

class InternshipCard extends StatefulWidget {
  final String title;
  final String company;
  final String role;
  final String location;
  final String datePosted;
  final String daysAgo;
  final String jobUrl; // Add jobUrl as a parameter
  final VoidCallback onTap;

  const InternshipCard({
    super.key,
    required this.title,
    required this.company,
    required this.role,
    required this.location,
    required this.datePosted,
    required this.daysAgo,
    required this.jobUrl, // Initialize jobUrl
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
                jobUrl: widget.jobUrl, // Pass the correct jobUrl here
              );
            },
          );
        },
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
