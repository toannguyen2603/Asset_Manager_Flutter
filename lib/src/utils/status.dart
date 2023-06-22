import 'package:flutter_riverpod/flutter_riverpod.dart';

class Status {
  Status();
  String checkStatus(int status) {
    switch (status) {
      case 1:
        return 'Ready to Deploy';
      case 2:
        return 'Pending';
      case 3:
        return 'Archived';
      case 4:
        return 'Broken';
      case 5:
        return 'Lost';
      case 6:
        return 'OutOfRepair';
    }
    return 'Unknown';
  }
}

final statusProvider = Provider<Status>((ref) => Status());
