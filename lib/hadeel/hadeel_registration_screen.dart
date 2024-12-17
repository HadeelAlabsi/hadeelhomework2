import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'hadeel_colors.dart';
import 'hadeel_validators.dart';
import 'hadeel_text_styles.dart';
import 'hadeel_custom_button.dart';
import 'hadeel_wave_card.dart';

class HadeelRegistrationScreen extends StatefulWidget {
  const HadeelRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<HadeelRegistrationScreen> createState() => _HadeelRegistrationScreenState();
}

class _HadeelRegistrationScreenState extends State<HadeelRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _acceptTerms = false;
  bool _isLoading = false;
  
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  
  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: HadeelColors.orangeGradient,
        ),
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    HadeelWaveCard(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'التسجيل',
                                style: HadeelTextStyles.headerStyle,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 30),
                              TextFormField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  labelText: 'البريد الإلكتروني',
                                  labelStyle: TextStyle(color: HadeelColors.white),
                                  prefixIcon: Icon(Icons.email, color: HadeelColors.white),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: HadeelColors.white),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: HadeelColors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: HadeelColors.white, width: 2),
                                  ),
                                ),
                                style: const TextStyle(color: HadeelColors.white),
                                validator: HadeelValidators.emailValidator,
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: _phoneController,
                                decoration: const InputDecoration(
                                  labelText: 'رقم الهاتف',
                                  labelStyle: TextStyle(color: HadeelColors.white),
                                  prefixIcon: Icon(Icons.phone, color: HadeelColors.white),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: HadeelColors.white),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: HadeelColors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: HadeelColors.white, width: 2),
                                  ),
                                ),
                                style: const TextStyle(color: HadeelColors.white),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(9),
                                ],
                                validator: HadeelValidators.phoneValidator,
                              ),
                              const SizedBox(height: 20),
                              CheckboxListTile(
                                value: _acceptTerms,
                                onChanged: (value) {
                                  setState(() {
                                    _acceptTerms = value ?? false;
                                  });
                                },
                                title: const Text(
                                  'اوافق',
                                  style: TextStyle(color: HadeelColors.white),
                                ),
                                checkColor: HadeelColors.primaryOrange,
                                activeColor: HadeelColors.white,
                              ),
                              const SizedBox(height: 100),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              Positioned(
                bottom: 30,
                left: 20,
                right: 20,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: HadeelCustomButton(
                    text: 'إرسال البيانات',
                    isLoading: _isLoading,
                    onPressed: () {
                      if (_formKey.currentState!.validate() && _acceptTerms) {
                        setState(() {
                          _isLoading = true;
                        });
                        Future.delayed(const Duration(seconds: 2), () {
                          setState(() {
                            _isLoading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'تم الإرسال بنجاح',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: HadeelColors.primaryOrange,
                              duration: Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          );
                          _emailController.clear();
                          _phoneController.clear();
                          setState(() {
                            _acceptTerms = false;
                          });
                        });
                      }
                    },
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