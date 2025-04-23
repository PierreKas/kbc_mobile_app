import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:kbc/colors/colors.dart';
import 'package:kbc/components/buttons.dart';
import 'package:kbc/components/country_picker_field.dart';
import 'package:kbc/components/date_picker.dart';
import 'package:kbc/components/label.dart';
import 'package:kbc/components/loading.dart';
import 'package:kbc/components/snack_bar.dart';
import 'package:kbc/components/textfields.dart';
import 'package:kbc/controller/membership_controller.dart';
import 'package:kbc/models/membership.dart';
import 'package:kbc/widget/kbc_appbar.dart';

class MemberShirpForm extends StatefulWidget {
  const MemberShirpForm({super.key});

  @override
  State<MemberShirpForm> createState() => _MemberShirpFormState();
}

class _MemberShirpFormState extends State<MemberShirpForm> {
  final TextEditingController _names = TextEditingController();
  final TextEditingController _date_of_birth = TextEditingController();
  final TextEditingController _place_of_birth = TextEditingController();
  final TextEditingController _nationality = TextEditingController();
  final TextEditingController _residence = TextEditingController();
  final TextEditingController _marital_status = TextEditingController();
  final TextEditingController _profession = TextEditingController();
  final TextEditingController _joining_kbc_date = TextEditingController();
  final TextEditingController _phone_number = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();

  DateTime? _selectedDoB;
  DateTime? _selected_joining_kbc_date;
  String? selectedGender;
  String? selectedEducationLevel;
  bool? isBaptized;
  bool? hasCompletedClasses;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KBCAppBar(title: 'Membership Form'),
      // AppBar(
      //   title: const MyTextHeader(content: 'Membership Form'),
      //   backgroundColor: MyColors.amber,
      //   elevation: 0,
      //   iconTheme: const IconThemeData(color: MyColors.black),
      //   titleTextStyle: const TextStyle(
      //     color: MyColors.black,
      //     fontSize: 20,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
      //drawer: const KBCDrawer(),
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [MyColors.amber.withOpacity(0.15), MyColors.white],
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Opacity(
                opacity: 1,
                child: Image.asset(
                  'assets/kbc_logo.jpeg',
                  fit: BoxFit.cover,
                  width: 220,
                  height: 220,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: MyColors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: MyColors.black.withOpacity(0.3),
                      blurRadius:
                          10, //The more I add this value, the more the shadow increase the size outside the container
                      offset: const Offset(0,
                          5), //Reduce the power of shadow on the top of the container
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Member Registration",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: MyColors.black,
                          ),
                        ),
                      ),
                    ),
                    _buildFormField(
                      label: 'Names',
                      controller: _names,
                      icon: Icons.person,
                    ),
                    _buildFormField(
                      label: 'Email',
                      controller: _email,
                      icon: Icons.email_outlined,
                    ),
                    _buildFormField(
                      label: 'Password',
                      controller: _password,
                      icon: Icons.lock,
                      obscureText: true,
                    ),
                    const TextFieldLabel(labelContent: 'Date of birth'),
                    const SizedBox(height: 8),
                    MyDatePicker(
                      controller: _date_of_birth,
                      icon: Icons.calendar_today,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1920),
                          lastDate: DateTime.now(),
                          initialDate: DateTime.now(),
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: const ColorScheme.light(
                                  primary: MyColors.amber,
                                  onPrimary: MyColors.black,
                                  onSurface: MyColors.black,
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    foregroundColor: MyColors.black,
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );

                        if (pickedDate != null) {
                          setState(() {
                            _selectedDoB = pickedDate;
                            _date_of_birth.text = _selectedDoB!
                                .toIso8601String()
                                .split('T')
                                .first;
                          });
                        }
                      },
                    ),
                    _buildFormField(
                      label: 'Place of birth',
                      controller: _place_of_birth,
                      icon: Icons.location_history,
                    ),
                    // _buildFormField(
                    //   label: 'Nationality',
                    //   controller: _nationality,
                    //   icon: Icons.flag,
                    // ),
                    CountryPickerField(
                      label: 'Nationality',
                      controller: _nationality,
                    ),
                    const TextFieldLabel(labelContent: 'Gender'),
                    const SizedBox(height: 8),
                    _buildDropdown(
                      value: selectedGender,
                      icon: Icons.person_outline,
                      items: const [
                        DropdownMenuItem(
                          value: 'MALE',
                          child: Text(
                            'MALE',
                            style: TextStyle(color: MyColors.black),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'FEMALE',
                          child: Text(
                            'FEMALE',
                            style: TextStyle(color: MyColors.black),
                          ),
                        ),
                      ],
                      onChanged: (String? gender) {
                        setState(() {
                          selectedGender = gender;
                        });
                      },
                    ),
                    _buildFormField(
                      label: 'Residence',
                      controller: _residence,
                      icon: Icons.location_on_outlined,
                    ),
                    _buildFormField(
                      label: 'Marital status',
                      controller: _marital_status,
                      icon: Icons.favorite_border,
                    ),
                    const TextFieldLabel(labelContent: 'Education level'),
                    const SizedBox(height: 8),
                    _buildDropdown(
                      value: selectedEducationLevel,
                      icon: Icons.school,
                      items: [
                        _buildDropdownItem('PRIMARY'),
                        _buildDropdownItem('O\'LEVEL', display: 'O LEVEL'),
                        _buildDropdownItem('A2 CERTIFICATE'),
                        _buildDropdownItem('BACHELOR\'S DEGREE',
                            display: 'BAC DEGREE'),
                        _buildDropdownItem('MASTER\'S DEGREE',
                            display: 'MASTER'),
                        _buildDropdownItem('TECHNICAL AND VOCATIONAL EDUCATION',
                            display: 'TECHN & VOCATIONAL EDUC'),
                      ],
                      onChanged: (String? edLvl) {
                        setState(() {
                          selectedEducationLevel = edLvl;
                        });
                      },
                    ),
                    _buildFormField(
                      label: 'Profession',
                      controller: _profession,
                      icon: Icons.work,
                    ),
                    const TextFieldLabel(labelContent: 'Joining KBC date'),
                    const SizedBox(height: 8),
                    MyDatePicker(
                      controller: _joining_kbc_date,
                      icon: Icons.calendar_today,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime(2013),
                          lastDate: DateTime.now(),
                          initialDate: DateTime.now(),
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: const ColorScheme.light(
                                  primary: MyColors.amber,
                                  onPrimary: MyColors.black,
                                  onSurface: MyColors.black,
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    foregroundColor: MyColors.black,
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (pickedDate != null) {
                          setState(() {
                            _selected_joining_kbc_date = pickedDate;
                            _joining_kbc_date.text = _selected_joining_kbc_date!
                                .toIso8601String()
                                .split('T')
                                .first;
                          });
                        }
                      },
                    ),
                    _buildFormField(
                      label: 'Phone number',
                      controller: _phone_number,
                      icon: Icons.phone_android,
                    ),
                    _buildRadio(label: 'Are you baptized?', isForBaptism: true),
                    _buildRadio(
                        label: 'Did you complete disclipleship classes?',
                        isForBaptism: false),
                    const SizedBox(height: 20),
                    // MyButtons(
                    //     height: 50,
                    //     width: double.infinity,
                    //     onPressed: () async {
                    //       String names = _names.text;
                    //       String dateOfBirthStr = _date_of_birth.text;
                    //       String placeOfBirth = _place_of_birth.text;
                    //       String nationality = _nationality.text;
                    //       String? gender = selectedGender;
                    //       String residence = _residence.text;
                    //       String maritalStatus = _marital_status.text;
                    //       String? educationLevel = selectedEducationLevel;
                    //       String profession = _profession.text;
                    //       String joiningKBCDateStr = _joining_kbc_date.text;
                    //       String phoneNumber = _phone_number.text;
                    //       String password = _password.text;
                    //       String email = _email.text;

                    //       DateTime? dateOfBirth = dateOfBirthStr.isNotEmpty
                    //           ? DateTime.tryParse(dateOfBirthStr)
                    //           : null;
                    //       DateTime? joiningKBCDate =
                    //           joiningKBCDateStr.isNotEmpty
                    //               ? DateTime.tryParse(joiningKBCDateStr)
                    //               : null;

                    //       Membership newMember = Membership(
                    //         dateOfBirth: dateOfBirth,
                    //         educationLevel: educationLevel!,
                    //         gender: gender!,
                    //         joiningKbcDate: joiningKBCDate,
                    //         maritalStatus: maritalStatus,
                    //         names: names,
                    //         nationality: nationality,
                    //         phoneNumber: phoneNumber,
                    //         profession: profession,
                    //         placeOfBirth: placeOfBirth,
                    //         residence: residence,
                    //         password: password,
                    //         email: email,
                    //       );
                    //       showAboutDialog(context: context);
                    //       try {
                    //         await MembershipController()
                    //             .recordMember(newMember);
                    //         Navigator.push(
                    //             context,
                    //             (MaterialPageRoute(
                    //                 builder: (context) => const LoginPage())));
                    //       } catch (e) {
                    //         Navigator.of(context).pop();
                    //         print('Error $e');
                    //       }

                    //       // _names.clear();
                    //       // _date_of_birth.clear();
                    //       // _place_of_birth.clear();
                    //       // _nationality.clear();
                    //       // _residence.clear();
                    //       // _marital_status.clear();
                    //       // _profession.clear();
                    //       // _joining_kbc_date.clear();
                    //       // _phone_number.clear();
                    //     },
                    //     text: 'Register'),
                    MyButtons(
                        height: 50,
                        width: double.infinity,
                        onPressed: () async {
                          showLoadingDialog(context, 'Sending data');
                          String names = _names.text;
                          String dateOfBirthStr = _date_of_birth.text;
                          String placeOfBirth = _place_of_birth.text;
                          String nationality = _nationality.text;
                          String? gender = selectedGender;
                          String residence = _residence.text;
                          String maritalStatus = _marital_status.text;
                          String? educationLevel = selectedEducationLevel;
                          String profession = _profession.text;
                          String joiningKBCDateStr = _joining_kbc_date.text;
                          String phoneNumber = _phone_number.text;
                          String password = _password.text;
                          String email = _email.text;

                          if (names.isEmpty ||
                              dateOfBirthStr.isEmpty ||
                              selectedGender == null ||
                              selectedEducationLevel == null ||
                              _phone_number.text.isEmpty ||
                              _password.text.isEmpty) {
                            print('Please fill all required fields');
                            MySnackBar.showErrorMessage(
                                'Please fill all required fields', context);
                            return;
                          }
                          DateTime? dateOfBirth = dateOfBirthStr.isNotEmpty
                              ? DateTime.tryParse(dateOfBirthStr)
                              : null;
                          DateTime? joiningKBCDate =
                              joiningKBCDateStr.isNotEmpty
                                  ? DateTime.tryParse(joiningKBCDateStr)
                                  : null;

                          Membership newMember = Membership(
                            dateOfBirth: dateOfBirth,
                            educationLevel: educationLevel!,
                            gender: gender!,
                            joiningKbcDate: joiningKBCDate,
                            maritalStatus: maritalStatus,
                            names: names,
                            nationality: nationality,
                            phoneNumber: phoneNumber,
                            profession: profession,
                            placeOfBirth: placeOfBirth,
                            residence: residence,
                            password: password,
                            email: email,
                            hasCompletedClasses: hasCompletedClasses!,
                            baptized: isBaptized!,
                          );

                          final success = await MembershipController()
                              .recordMember(newMember);
                          Navigator.of(context).pop();
                          if (success != null) {
                            MySnackBar.showSuccessMessage(
                                'The member has been successfully registered',
                                context);
                          } else {
                            MySnackBar.showErrorMessage(
                                'An error occured, try again please', context);
                          }
                          _names.clear();
                          _date_of_birth.clear();
                          _place_of_birth.clear();
                          _nationality.clear();
                          _residence.clear();
                          _marital_status.clear();
                          _profession.clear();
                          _joining_kbc_date.clear();
                          _phone_number.clear();
                          _password.clear();
                          _email.clear();
                        },
                        text: 'Register'),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldLabel(labelContent: label),
        const SizedBox(height: 8),
        MyTextField(
          controller: controller,
          enabled: true,
          hintText: '',
          obscureText: obscureText,
          prefixIcon: icon,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildRadio({required String label, required bool isForBaptism}) {
    bool? groupValue = isForBaptism ? isBaptized : hasCompletedClasses;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldLabel(labelContent: label),
        const SizedBox(height: 8),
        RadioListTile<bool>(
          activeColor: MyColors.amber,
          hoverColor: MyColors.black.withOpacity(0.3),
          title: const TextFieldLabel(labelContent: 'Yes'),
          value: true,
          groupValue: groupValue,
          onChanged: (bool? value) {
            setState(() {
              if (isForBaptism) {
                isBaptized = value!;
                print('New value: $isBaptized');
              } else {
                hasCompletedClasses = value!;
                print('New class value : $hasCompletedClasses');
              }
            });
          },
        ),
        RadioListTile<bool>(
          activeColor: MyColors.amber,
          hoverColor: MyColors.black.withOpacity(0.3),
          title: const TextFieldLabel(labelContent: 'No'),
          value: false,
          groupValue: groupValue,
          onChanged: (bool? value) {
            setState(() {
              if (isForBaptism) {
                isBaptized = value!;
                print('New value: $isBaptized');
              } else {
                hasCompletedClasses = value!;
                print('New class value : $hasCompletedClasses');
              }
            });
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDropdown({
    required String? value,
    required IconData icon,
    required List<DropdownMenuItem<String>> items,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: DropdownButtonFormField<String>(
            dropdownColor: Colors.white,
            value: value,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                icon,
                color: MyColors.amber,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            items: items,
            onChanged: onChanged,
            style: const TextStyle(color: MyColors.black),
            icon: const Icon(Icons.arrow_drop_down, color: MyColors.amber),
            isExpanded: true,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  DropdownMenuItem<String> _buildDropdownItem(String value, {String? display}) {
    return DropdownMenuItem(
      value: value,
      child: Text(
        display ?? value,
        style: const TextStyle(
          color: MyColors.black,
        ),
      ),
    );
  }
}
