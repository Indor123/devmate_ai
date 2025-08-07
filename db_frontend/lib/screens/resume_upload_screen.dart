import 'package:flutter/material.dart';

class ResumeUploadScreen extends StatefulWidget {
  const ResumeUploadScreen({super.key});

  @override
  State<ResumeUploadScreen> createState() => _ResumeUploadScreenState();
}

class _ResumeUploadScreenState extends State<ResumeUploadScreen> {
  String? _fileName;

  void _pickResume() async {
    // TODO: Implement file picker for Android & Web
    // For now, we simulate the file pick:
    setState(() {
      _fileName = "sample_resume.pdf";
    });
  }

  void _submitResume() {
    if (_fileName == null) return;

    // TODO: Call backend API to submit resume
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Resume submitted for analysis.")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('📄 Upload Resume')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: InkWell(
                onTap: _pickResume,
                child: Container(
                  height: 180,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: _fileName == null
                        ? const Text('Tap to upload resume (PDF)', style: TextStyle(fontSize: 16))
                        : Text('Selected: $_fileName', style: const TextStyle(fontSize: 16)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _fileName != null ? _submitResume : null,
              icon: const Icon(Icons.cloud_upload),
              label: const Text("Submit for Analysis"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}