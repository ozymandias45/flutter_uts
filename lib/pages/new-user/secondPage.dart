import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                    _submitForm();
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
    // Access form data here, for example:
    String name = _nameController.text;
    String email = _emailController.text;
    String address = _addressController.text;

    // Do something with the form data, such as sending it to an API or displaying it.
    print('Name: $name, Email: $email, Address: $address');
  }
}
