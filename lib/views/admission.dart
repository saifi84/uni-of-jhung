
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class StudentAdmissionForm extends StatefulWidget {
  @override
  _StudentAdmissionFormState createState() => _StudentAdmissionFormState();
}

class _StudentAdmissionFormState extends State<StudentAdmissionForm> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  String? _fatherName;
  String? _dob;
  String? _gender;
  String? _contactNumber;
  String? _email;
  String? _address;
  String? _previousSchool;
  String? _previousClass;
  String _selectedEducation = '';
    String _selectedGender = '';
  String _selectedEducationHSSC = '';


  Future<void> saveAdmissionForm({required String name, required String fatherName,required String dob, required String selectedGender , required String contactNumber , required String email , 
    required String address , required String previousSchool , required String previousClass , required String selectedEducation , required String selectedEducationHSSC
   }) async {
    try {
      
      await FirebaseFirestore.instance
          .collection('admission')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
            'uid' : FirebaseAuth.instance.currentUser!.uid , 'name' : name , 'fatherName' : fatherName , 'dateOfBirth': dob , 'gender' : selectedGender , 'contactNumber' : contactNumber,
            'email' : email , 'previousSchool' : previousSchool , 'previousClass' : previousClass , 'SSC' : selectedEducation , 'HSSC' : selectedEducationHSSC

          });

     
    } on FirebaseAuthException catch (e) {
      // if you want to display your own custom error message
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      //Displaying the usual firebase error message
    }
  }


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _dob) {
      setState(() {
        _dob = picked.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                   
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Father Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your father name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _fatherName = value!;
                },
              ),
              InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Date of Birth',
                    hintText: 'dd/mm/yyyy',
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        _dob == null
                            ? 'Select Date'
                            : DateFormat('dd/MM/yyyy')
                                .format(DateTime.parse(_dob.toString())),
                      ),
                      const Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const Text(
                'Select your Gender:',
                style: const TextStyle(fontSize: 18.0),
              ),
              Row(
                children: [
                  Radio(
                    value: 'Male',
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value.toString();
                      });
                    },
                  ),
                  const Text('Male'),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 'Female',
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value.toString();
                      });
                    },
                  ),
                  const Text('Female'),
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Contact Number',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your contact number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _contactNumber = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Address',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _address = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Previous School',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your previous school';
                  }
                  return null;
                },
                onSaved: (value) {
                  _previousSchool = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Previous Class',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your previous school';
                  }
                  return null;
                },
                onSaved: (value) {
                  _previousSchool = value!;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Select your SSC education:',
                style: const TextStyle(fontSize: 18.0),
              ),
              Row(
                children: [
                  Radio(
                    value: 'Matric',
                    groupValue: _selectedEducation,
                    onChanged: (value) {
                      setState(() {
                        _selectedEducation = value.toString();
                      });
                    },
                  ),
                  const Text('Matric'),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 'O-Level',
                    groupValue: _selectedEducation,
                    onChanged: (value) {
                      setState(() {
                        _selectedEducation = value.toString();
                      });
                    },
                  ),
                  const Text('O-Level'),
                ],
              ),
              const Text(
                'Select your HSSC education:',
                style: const TextStyle(fontSize: 18.0),
              ),
              Row(
                children: [
                  Radio(
                    value: 'FSc',
                    groupValue: _selectedEducationHSSC,
                    onChanged: (value) {
                      setState(() {
                        _selectedEducationHSSC = value.toString();
                      });
                    },
                  ),
                  const Text('FSc'),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 'A-Level',
                    groupValue: _selectedEducationHSSC,
                    onChanged: (value) {
                      setState(() {
                        _selectedEducationHSSC = value.toString();
                      });
                    },
                  ),
                  const Text('A-Level'),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),

               Center(
                 child: ElevatedButton(
                          child: const Text('Submit'),
                          onPressed: () {

                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                                  saveAdmissionForm(name: _name.toString(), fatherName: _fatherName.toString(), dob: _dob.toString(), selectedGender: _selectedGender, contactNumber: _contactNumber.toString(), email: _email.toString(), address: _address.toString(), previousSchool: _previousSchool.toString(), previousClass: _previousClass.toString(), selectedEducation: _selectedEducation, selectedEducationHSSC: _selectedEducationHSSC);
                            }

                            showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(' Success'),
          content: const Text('Admission form has been submitted successfully!'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                    _name = "";
              _fatherName = "";
              _gender = "";
              _contactNumber = "";
              _email = "";
              _address = "";
              _previousSchool = "";
            _previousClass = "";
              _selectedEducation = '';
                _selectedGender = '';
              _selectedEducationHSSC = '';

              Navigator.pop(context, 'OK');


                });
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
                            
                          },
                        ),
               ),
            ])),
      ),
    );
  }
}
