import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgetform/model/user.dart';
import 'package:widgetform/pages/user_info_page.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({Key? key}) : super(key: key);

  @override
  State<RegisterFormPage> createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  bool _hidePass = true;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _storyController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final List<String> _countries = ['Russia', 'Ukraine', 'Germany', 'France'];
  String? _selectedCountry;

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passFocus = FocusNode();

  User newUser = User();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _storyController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _passFocus.dispose();
    super.dispose();
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tegister Form'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              focusNode: _nameFocus,
              autofocus: true,
              onFieldSubmitted: (_) {
                return _fieldFocusChange(context, _nameFocus, _phoneFocus);
              },
              validator: _validateName,
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                hintText: 'What do people call you?',
                prefixIcon: const Icon(Icons.person),
                suffixIcon: GestureDetector(
                  onTap: () {
                    _nameController.clear();
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              onSaved: (value) => newUser.name = value!,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              focusNode: _phoneFocus,
              onFieldSubmitted: (_) =>
                  _fieldFocusChange(context, _phoneFocus, _passFocus),
              controller: _phoneController,
              inputFormatters: [
                FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,15}$'),
                    allow: true),
                // FilteringTextInputFormatter.digitsOnly,
              ],
              validator: (value) => _validatePhoneNumber(value!)
                  ? null
                  : 'Phone number must be entered as (XXX)-XXX-XX-XX',
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                hintText: 'Where can we reach you',
                prefixIcon: const Icon(Icons.call),
                suffixIcon: GestureDetector(
                  onLongPress: () {
                    _phoneController.clear();
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                helperText: '(XXX)-XXX-XX-XX',
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              onSaved: (value) => newUser.phone = value!,
            ),
            TextFormField(
              validator: _validateEmail,
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email Address',
                hintText: 'Enter a Email addres',
                prefixIcon: Icon(Icons.mail),
              ),
              onSaved: (value) => newUser.email = value!,
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.map),
                  labelText: 'Country ?'),
              items: _countries.map((country) {
                return DropdownMenuItem(child: Text(country), value: country);
              }).toList(),
              onChanged: (country) {
                print(country);
                setState(() {
                  _selectedCountry = country as String;
                  newUser.country = country;
                });
              },
              value: _selectedCountry,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _storyController,
              decoration: const InputDecoration(
                labelText: 'Life Story',
                hintText: 'Tell us about your self',
                helperText: 'Keep it short, this is just a demo',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              inputFormatters: [
                LengthLimitingTextInputFormatter(100),
              ],
              // onSaved: (value) {
              //   newUser.story.isNotEmpty ? newUser.story = value! : null;
              // },
              onSaved: (value) => newUser.story = value!,
              validator: _validateStory,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              focusNode: _passFocus,
              onFieldSubmitted: (_) =>
                  _fieldFocusChange(context, _passFocus, _nameFocus),
              validator: _validatePassword,
              controller: _passwordController,
              obscureText: _hidePass,
              maxLength: 8,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter the pasword',
                prefixIcon: const Icon(Icons.security),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _hidePass = !_hidePass;
                    });
                  },
                  icon: Icon(_hidePass
                      ? Icons.visibility
                      : Icons.visibility_off_outlined),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                hintText: 'Confirm the password',
                prefixIcon: Icon(Icons.password_outlined),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: _submitForm,
              child: const Text(
                'Submit Form',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      _showDialog(name: _nameController.text);
      print('Name: ${_nameController.text}');
      print('Phone: ${_phoneController.text}');
      print('Email: ${_emailController.text}');
      print('Country: $_selectedCountry');
      print('Life Story: ${_storyController.text}');
      print('Password: ${_passwordController.text}');
      print('Confirm Password: ${_confirmPasswordController.text}');
    } else {
      _showMessage(message: 'Form is not valid. Please review and correct');
    }
  }

  String? _validateName(String? value) {
    final _nameExp = RegExp(r'[A-Za-z]+$');
    if (value!.isEmpty) {
      return 'Name is reqired';
    } else if (!_nameExp.hasMatch(value)) {
      return 'Please enter alpabetical characters';
    } else {
      return null;
    }
  }

  bool _validatePhoneNumber(String input) {
    final _phoneExp = RegExp(r'^\d\d\d\\d\d\d\-\d\d-\d\d$');
    return _phoneExp.hasMatch(input);
  }

  String? _validateEmail(String? value) {
    if (_emailController.text.isEmpty) {
      return null;
    } else if (value!.isEmpty) {
      return 'Email cannot be empty';
    } else if (!_emailController.text.contains('@')) {
      return 'Invalid Email address';
    } else {
      null;
    }
  }

  String? _validateStory(String? value) {
    if (_storyController.text.isEmpty) {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if (_passwordController.text.length != 8) {
      return '8 characters required for password';
    } else if (_passwordController.text != _confirmPasswordController.text) {
      return 'Password does not match';
    } else {
      return null;
    }
  }

  void _showMessage({String? message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.red,
        content: Text(
          message!,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16.0),
        ),
      ),
    );
  }

  void _showDialog({String? name}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Registration succesful',
            style: TextStyle(color: Colors.green),
          ),
          content: Text(
            '$name is now a verified register',
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18.0,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => UserInfoPage(
                      userInfo: newUser,
                    ),
                  ),
                );
              },
              child: const Text(
                'Verified',
                style: TextStyle(color: Colors.green, fontSize: 18.0),
              ),
            ),
          ],
        );
      },
    );
  }
}
