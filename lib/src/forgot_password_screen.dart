import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthForgotPasswordScreen extends StatefulWidget {
  final VoidCallback? onBackToLogin;

  const FirebaseAuthForgotPasswordScreen({
    Key? key,
    this.onBackToLogin,
  }) : super(key: key);

  @override
  _FirebaseAuthForgotPasswordScreenState createState() => _FirebaseAuthForgotPasswordScreenState();
}

class _FirebaseAuthForgotPasswordScreenState extends State<FirebaseAuthForgotPasswordScreen> {
  final _emailCtrl = TextEditingController();
  final _formKey   = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _info;

  @override
  void dispose() {
    _emailCtrl.dispose();
    super.dispose();
  }

  Future<void> _handleReset() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailCtrl.text.trim(),
      );
      setState(() => _info = 'Reset link sent! Check your email.');
    } on FirebaseAuthException catch (e) {
      setState(() => _info = e.message);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text('Forgot Password', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      if (_info != null) ...[
                        Text(_info!, style: const TextStyle(color: Colors.teal)),
                        const SizedBox(height: 12),
                      ],
                      TextFormField(
                        controller: _emailCtrl,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Email',
                          filled: true,
                          fillColor: Color(0x1F5F5F87),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                        ),
                        validator: (v) => v == null || v.isEmpty ? 'Enter email' : null,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _handleReset,
                          child: const Text('Send Reset Link', style: TextStyle(fontSize: 18)),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: widget.onBackToLogin,
                        child: const Text('Back to Login'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (_isLoading)
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
