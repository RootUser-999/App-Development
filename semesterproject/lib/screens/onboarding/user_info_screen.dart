import 'package:flutter/material.dart';
import '../home/home_screen.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  String _selectedGoal = 'Lose Weight';

  final List<String> _goals = [
    'Lose Weight',
    'Gain Muscle',
    'Improve Endurance',
    'Stay Fit'
  ];

  void _submitInfo() {
    if (_formKey.currentState!.validate()) {
      // Save user data to local or Firebase here
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: (value) =>
            value == null || value.isEmpty ? 'Required field' : null,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField<String>(
        value: _selectedGoal,
        decoration: InputDecoration(
          labelText: 'Fitness Goal',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        items: _goals
            .map((goal) => DropdownMenuItem(value: goal, child: Text(goal)))
            .toList(),
        onChanged: (value) {
          setState(() {
            _selectedGoal = value!;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tell Us About You"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(
                controller: _nameController,
                label: 'Name',
                hint: 'John Doe',
              ),
              _buildTextField(
                controller: _ageController,
                label: 'Age',
                hint: 'e.g. 25',
                keyboardType: TextInputType.number,
              ),
              _buildTextField(
                controller: _weightController,
                label: 'Weight (kg)',
                hint: 'e.g. 70',
                keyboardType: TextInputType.number,
              ),
              _buildDropdown(),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitInfo,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
