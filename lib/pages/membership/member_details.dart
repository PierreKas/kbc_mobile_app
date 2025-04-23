import 'package:flutter/material.dart';
import 'package:kbc/colors/colors.dart';
import 'package:kbc/controller/membership_controller.dart';
import 'package:kbc/models/membership.dart';
import 'package:kbc/components/text_hearder.dart';
import 'package:kbc/pages/membership/membership_page.dart';
import 'package:kbc/widget/kbc_appbar.dart';
import 'package:kbc/widget/kbc_drawer.dart';

class MemberDetails extends StatefulWidget {
  final int id = MembershipController.memberId;

  MemberDetails({
    super.key,
  });

  @override
  State<MemberDetails> createState() => _MemberDetailsState();
}

class _MemberDetailsState extends State<MemberDetails> {
  @override
  void initState() {
    super.initState();
    _fetchMemberDetails();
  }

  Membership? memberDetails;
  bool isLoading = true;

  Future<void> _fetchMemberDetails() async {
    setState(() {
      isLoading = true;
    });

    try {
      memberDetails = await MembershipController().memberInfo(widget.id);
    } catch (e) {
      // Handle error
      print('Error fetching member details: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _showUpdateInfoDialog() {
    // Implement your update info dialog or navigation here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Update member info functionality coming soon'),
        backgroundColor: MyColors.bordeauxRed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KBCAppBar(title: 'Member Details'),
      drawer: const KBCDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [MyColors.amber.withOpacity(0.15), MyColors.white],
          ),
        ),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: MyColors.amber,
                ),
              )
            : memberDetails == null
                ? const Center(
                    child: Text('Member not found'),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 15),
                      child: Column(
                        children: [
                          _buildMemberHeader(),
                          const SizedBox(height: 20),
                          _buildDetailsSection('Personal Information'),
                          const SizedBox(height: 15),
                          _buildDetailsSection('Church Information'),
                          // const SizedBox(height: 15),
                          // _buildDetailsSection('Additional Information'),
                        ],
                      ),
                    ),
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MemberShirpForm()));
        },
        backgroundColor: MyColors.amber,
        child: const Icon(
          Icons.add,
          color: MyColors.bordeauxRed,
        ),
      ),
    );
  }

  Widget _buildMemberHeader() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: MyColors.amber,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: MyColors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: MyColors.bordeauxRed,
            // child: Icon(
            //   Icons.person,
            //   size: 60,
            //   color: MyColors.bordeauxRed,
            // ),
            child: Text(
              memberDetails!.names.substring(0, 1).toUpperCase(),
              style: const TextStyle(fontSize: 40, color: MyColors.amber),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            memberDetails?.names ?? 'Member Name',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: MyColors.bordeauxRed,
            ),
          ),
          // const SizedBox(height: 8),
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          //   decoration: BoxDecoration(
          //     color: MyColors.amber,
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   child: const Text(
          //     'Active Member',
          //     style: TextStyle(
          //       fontSize: 14,
          //       fontWeight: FontWeight.bold,
          //       color: MyColors.bordeauxRed,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildDetailsSection(String title) {
    // Define the content based on section title
    String baptized = '';
    String classes = '';
    if (memberDetails!.baptized) {
      baptized = 'Yes';
    } else {
      baptized = 'No';
    }
    if (memberDetails!.hasCompletedClasses) {
      classes = 'Graduated';
    } else {
      classes = 'Currently studying';
    }
    List<Map<String, String>> items = [];

    if (title == 'Personal Information') {
      items = [
        {'label': 'Full Name', 'value': memberDetails?.names ?? 'N/A'},
        {'label': 'Phone', 'value': memberDetails?.phoneNumber ?? 'N/A'},
        {'label': 'Email', 'value': memberDetails?.email ?? 'N/A'},
        {'label': 'Address', 'value': memberDetails?.residence ?? 'N/A'},
        {
          'label': 'Date of Birth',
          'value':
              memberDetails!.dateOfBirth!.toIso8601String().substring(0, 10)
        },
        {
          'label': 'Marital Status',
          'value': memberDetails?.maritalStatus ?? 'N/A'
        },
        {'label': 'Nationality', 'value': memberDetails?.nationality ?? 'N/A'}
      ];
    } else if (title == 'Church Information') {
      items = [
        {
          'label': 'Member Since',
          'value': memberDetails?.joiningKbcDate!
                  .toIso8601String()
                  .substring(0, 7) ??
              'N/A'
        },
        // {'label': 'Ministry', 'value': 'N/A'},
        {'label': 'Baptized', 'value': baptized},

        {'label': 'Discipleship classes', 'value': classes},
        // {'label': 'Cell Group', 'value': 'N/A'},
      ];
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: MyColors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: MyColors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          MyTextHeader(
            content: title,
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            thickness: 4,
            endIndent: 90,
            indent: 90,
            color: MyColors.amber,
          ),
          const SizedBox(height: 10),
          ...items.map((item) => _buildInfoRow(item['label']!, item['value']!)),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: MyColors.bordeauxRed,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: MyColors.black.withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
