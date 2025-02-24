import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';
import '../widgets/custom_text_field.dart';
import 'result_screen.dart';

class InputScreen extends StatelessWidget {
  final NICController nicController = Get.put(NICController());
  final TextEditingController nicInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade800,
              Colors.purple.shade800,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Logo or Title
              Text(
                "NIC Decoder",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Decode Sri Lankan NIC Numbers",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 40),

              // NIC Input Field
              CustomTextField(
                controller: nicInputController,
                labelText: "Enter NIC Number",
                hintText: "e.g., 200177101840 or 853400937V",
                icon: Icons.credit_card,
              ),
              SizedBox(height: 20),

              // Decode Button
              ElevatedButton(
                onPressed: () {
                  if (nicInputController.text.isEmpty) {
                    Get.snackbar(
                      "Error",
                      "Please enter a valid NIC number",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red.shade800,
                      colorText: Colors.white,
                    );
                  } else {
                    nicController.decodeNIC(nicInputController.text);
                    Get.to(() => ResultScreen());
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade800,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Decode NIC",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
