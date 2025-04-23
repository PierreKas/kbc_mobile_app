// import 'package:kbc/components/toast_message.dart';
// import 'package:mysql_client/mysql_client.dart';

// class DatabaseHelper {
//   ///==========sAlways data'===============\\\
//   static String host = 'mysql-pierrekasanani.alwaysdata.net';
//   static int port = 3306;
//   static String username = '375592';
//   static String password = 'Kasa2002@';
//   static String databaseName = 'pierrekasanani_kbc_members';

//   static MySQLConnection? conn;
//   // Get a connection
//   static Future<MySQLConnection?> getConnection() async {
//     try {
//       if (conn != null && conn?.connected == true) return conn!;
//       conn = await MySQLConnection.createConnection(
//         host: host,
//         port: port,
//         userName: username,
//         password: password,
//         databaseName: databaseName,
//         secure: true,
//       );

//       await conn!.connect();
//       print('DB connected successfully');

//       return conn!;
//     } on Exception catch (e) {
//       print(e.toString());
//       if (e.toString().contains('No address associated with hostname')) {
//         MyToast.showErrorMessage('Check your internet connexion');
//       }
//       return null;
//     }
//   }

//   static Future<void> closeConnection() async {
//     if (conn != null && conn!.connected) {
//       try {
//         await conn!.close();
//         print('DB connection closed successfully');
//       } catch (e) {
//         print('Error closing DB connection: $e');
//       }
//     } else {
//       print('Connection is not established or already closed.');
//     }
//   }
// }
