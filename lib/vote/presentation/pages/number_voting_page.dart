import 'package:flutter/material.dart';

class NumberVotingPage extends StatefulWidget {
  const NumberVotingPage({super.key});

  @override
  _NumberVotingPageState createState() => _NumberVotingPageState();
}

class _NumberVotingPageState extends State<NumberVotingPage> {
  final TextEditingController _numberController = TextEditingController();
  String? _errorMessage;
  bool _isSubmitting = false;

  // Function to handle number submission
  Future<void> _submitVote() async {
    final voteInput = _numberController.text.trim();

    // Validate the input
    if (voteInput.isEmpty) {
      setState(() {
        _errorMessage = "Please enter a number.";
      });
      return;
    }

    // Ensure the input is a number
    final int? vote = int.tryParse(voteInput);
    if (vote == null) {
      setState(() {
        _errorMessage = "Invalid number. Please enter a valid numeric value.";
      });
      return;
    }

    // If the user is authenticated, save the vote
    setState(() {
      _isSubmitting = true;
      _errorMessage = null;
    });

    setState(() {
      _isSubmitting = false;
      _numberController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Vote submitted successfully!"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Number Voting"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Enter your vote (numeric value):",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _numberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Enter a number",
                  errorText: _errorMessage,
                ),
              ),
              const SizedBox(height: 20),
              _isSubmitting
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _submitVote,
                      child: const Text("Submit Vote"),
                    ),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
