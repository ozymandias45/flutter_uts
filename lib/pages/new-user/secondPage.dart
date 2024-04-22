import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../new-user/firstPage.dart';
import 'dart:async';

enum Gender { male, female }

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Identitas Anda'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  Gender _selectedGender = Gender.male;
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Nama'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Silahkan masukan nama Anda';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Silakan masukkan email Anda';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(labelText: 'No. Telepon'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Silakan masukkan no.telepon Anda';
              }
              return null;
            },
            keyboardType: TextInputType.phone,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<Gender>(
            value: _selectedGender,
            onChanged: (value) {
              setState(() {
                _selectedGender = value!;
              });
            },
            items: const [
              DropdownMenuItem(
                value: Gender.male,
                child: Text('Laki-laki'),
              ),
              DropdownMenuItem(
                value: Gender.female,
                child: Text('Perempuan'),
              ),
            ],
            decoration: const InputDecoration(
              labelText: 'Jenis Kelamin',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null) {
                return 'Silakan pilih jenis kelamin';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          TextField(
            controller: _addressController,
            decoration: InputDecoration(
              labelText: 'Alamat',
              hintText: 'Masukkan alamat Anda',
              border: const OutlineInputBorder(),
              errorText: _validate ? 'Silakan masukkan alamat Anda' : null,
            ),
            maxLines: 3,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState != null) {
                  setState(() {
                    _validate = _addressController.text.isEmpty;
                  });
                  if (_formKey.currentState!.validate()) {
                    Fluttertoast.showToast(
                        msg: "Berhasil Daftar!",
                        backgroundColor: Colors.green,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 2);
                    Timer(const Duration(seconds: 2), () {
                      _submitForm();
                    });
                  } else {
                    Fluttertoast.showToast(
                        msg: "Tolong lengkapi form yang masih kosong!",
                        backgroundColor: Colors.red,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 3);
                  }
                }
              },
              child: const Text('Simpan'),
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    String name = _nameController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;
    String address = _addressController.text;

    if (name.isNotEmpty &&
        email.isNotEmpty &&
        phone.isNotEmpty &&
        address.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FirstPage()),
      );
    }
  }
}
