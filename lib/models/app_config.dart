// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// class AppConfig {
//   static List<Info> infos = [];
// }

// class Info {
//   final int app_id;
//   final String app_name;
//   final String app_logo;
//   final String app_desc;

//   Info(
//     this.app_id,
//     this.app_name,
//     this.app_logo,
//     this.app_desc,
//   );

//   Info copyWith({
//     int? app_id,
//     String? app_name,
//     String? app_logo,
//     String? app_desc,
//   }) {
//     return Info(
//       app_id ?? this.app_id,
//       app_name ?? this.app_name,
//       app_logo ?? this.app_logo,
//       app_desc ?? this.app_desc,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'app_id': app_id,
//       'app_name': app_name,
//       'app_logo': app_logo,
//       'app_desc': app_desc,
//     };
//   }

//   factory Info.fromMap(Map<String, dynamic> map) {
//     return Info(
//       map['app_id'] as int,
//       map['app_name'] as String,
//       map['app_logo'] as String,
//       map['app_desc'] as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Info.fromJson(String source) =>
//       Info.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'Item(app_id: $app_id, app_name: $app_name, app_logo: $app_logo, app_desc: $app_desc)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is Info &&
//         other.app_id == app_id &&
//         other.app_name == app_name &&
//         other.app_logo == app_logo &&
//         other.app_desc == app_desc;
//   }

//   @override
//   int get hashCode {
//     return app_id.hashCode ^
//         app_name.hashCode ^
//         app_logo.hashCode ^
//         app_desc.hashCode;
//   }
// }
import 'package:http/http.dart' as http;

class JsonServer {
  static String url = "http://127.0.0.1:3000/";
}
