// import 'package:kbc/components/toast_message.dart';
// import 'package:kbc/database/conn_string.dart';
// import 'package:kbc/models/membership.dart';

// class MembershirpDatabaseHelper {
//   Future<List<Map<String, dynamic>>> getMembersToDB() async {
//     final conn = await DatabaseHelper.getConnection();
//     const sql = 'SELECT * FROM members_info';
//     if (conn == null) {
//       return [];
//     }
//     try {
//       final results = await conn.execute(sql);
//       final clients = results.rows.map((row) => row.assoc()).toList();

//       print('Members list retrieved successfully');
//       return clients;
//     } catch (e) {
//       print('Error during SELECT operation: $e');
//       return [];
//     } finally {
//       await conn.close();
//     }
//   }

//   Future<void> addMemberToDB(Membership member) async {
//     final conn = await DatabaseHelper.getConnection();
//     if (conn == null) {
//       return;
//     }

//     final sql = '''
//     INSERT INTO members_info (names,date_of_birth, place_of_birth,nationality,gender,residence,marital_status,education_level,profession,joining_kbc_date,phone_number,password)
//     VALUES (
//       '${member.names}',
//       '${member.dateOfBirth}',
//       '${member.placeOfBirth}',
//       '${member.nationality}',
//       '${member.gender}',
//       '${member.residence}',
//       '${member.maritalStatus}',
//       '${member.educationLevel}',
//       '${member.profession}',
//       '${member.joiningKbcDate}',
//       '${member.phoneNumber}',
//       '${member.password}'
      
//     )
//   ''';

//     try {
//       await conn.execute(sql);
//       print('Member added successfully');
//       MyToast.showSuccessMessage('Member added successfully');
//     } catch (e) {
//       print('Error during INSERT operation: $e');
//       MyToast.showErrorMessage('Somothing went wrong');
//     } finally {
//       await conn.close();
//     }
//   }
// }
