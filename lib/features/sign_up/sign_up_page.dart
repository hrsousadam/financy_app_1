import 'dart:developer';
import 'package:financy_app/common/utils/validator.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:logging/logging.dart';
import '../../common/constanst/app_colors.dart';
import '../../common/constanst/app_text_styles.dart';
import '../../common/utils/uppercase_text_formatter.dart';
import '../../common/widgets/custom_text_form_field.dart';
import '../../common/widgets/multi_text_button.dart';
import '../../common/widgets/password_form_field.dart';
import '../../common/widgets/primary_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _logger = Logger('SignUpPage');
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _configureLogging();
  }

  void _configureLogging() {
    Logger.root.level =
        Level.ALL; // Configure o nível de log conforme necessário
    Logger.root.onRecord.listen((record) {
      log('${record.level.name}: ${record.time}: ${record.message}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                  height: 50), // Adicione um espaço superior para o cabeçalho
              _buildHeaderText('Spend Smarter', AppColors.greenLightTwo),
              _buildHeaderText('Save More', AppColors.greenLightTwo),
              SizedBox(
                height: 200,
                child: Image.asset('assets/images/sign_up_image.png'),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      labelText: 'your name',
                      hintText: 'JOHN DOE',
                      inputFormatters: [UpperCaseTextInputFormatter()],
                      validator: Validador.validateName,
                      textCapitalization: TextCapitalization.characters,
                      keyboardType: TextInputType.name,
                      controller: null,
                    ),
                    CustomTextFormField(
                      labelText: "your email",
                      hintText: "john@email.com",
                      validator: Validador.validateEmail,
                      textCapitalization: TextCapitalization.none,
                      controller: TextEditingController(),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    PasswordFormField(
                      controller: _passwordController,
                      labelText: 'choose your password',
                      hintText: '********',
                      validator: Validador.validatePassword,
                      helperText:
                          "Must have at least 8 characters, 1 capital letter and 1 number.",
                    ),
                    PasswordFormField(
                      labelText: 'confirm your password',
                      hintText: '********',
                      controller: TextEditingController(),
                      validator: (value) => Validador.validateConfirmPassword(
                        value,
                        _passwordController.text,
                      ),
                    ),
                  ],
                ),
              ),
              _buildSignUpButton(),
              _buildLoginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderText(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: AppTextStyle.mediumText.copyWith(color: color),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      child: PrimaryButton(
        text: 'Sign Up',
        onPressed: () {
          final valid = _formKey.currentState != null &&
              _formKey.currentState!.validate();
          if (valid) {
            log("continuar logica de login");
          } else {
            log("erro ao logar");
          }
        },
      ),
    );
  }

  Widget _buildLoginButton() {
    return MultiTextButton(
      onPressed: () => _logger.info('Tap on Log In button'),
      children: [
        Text(
          'Already have an account? ',
          style: AppTextStyle.smallText.copyWith(color: AppColors.grey),
        ),
        Text(
          'Log In',
          style:
              AppTextStyle.smallText.copyWith(color: AppColors.greenLightTwo),
        ),
      ],
    );
  }
}
