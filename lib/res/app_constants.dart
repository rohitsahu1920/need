import 'dart:ui';

import 'package:need_flutter_app/models/locale_model.dart';

class AppConstants {
  static const double mapCameraZoom = 17;
}

final supportedLanguages = <LocaleModel>[
  LocaleModel('English', Locale('en', 'US')),
  LocaleModel('Spanish', Locale('es')),
  LocaleModel('Portuguese', Locale('pt')),
];

class UserType {
  static const String fr = "Field Representative";
  static const String fm = "Field Manager";
  static const String dispatcher = "Dispatcher";
}

class AcceptRejectFlag {
  static const int unaccepted = 0;
  static const int accepted = 1;
  static const int rejected = 2;
  static const int remindMeLater = 3;
}

class LeavesAcceptReject {
  static const String approved = "approved";
  static const String rejected = "rejected";
}

class CalendarColors {
  static const String red = "Red";
  static const String orange = "Orange";
  static const String green = "Green";
}

class LogConstants {
  static const String LogName = "TrackHelpLogs";
  static const String shareName = "TrackHelp Logs";
  static const String className = "Class Name:";
  static const String methodName = "Method Name:";
  static const String apiUrl = "Method Name:";
  static const String apiRequest = "Api Request:";
  static const String appLog = "App Log:";
}

class NotificationType {
  static const String assignVisit = "assign_visit";
  static const String priorityChanged = "priority_changed";
  static const String changingTimeSlotNotifyToFieldRepresentative =
      "changing time-slot notify to field-representative";
  static const String actionForFwReassignmentForRequest =
      "action for fw reassignment for request";
  static const String actionForRejectingClosureRequestToFieldRepresentative =
      "action for rejecting closure request to field representative";
  static const String visitAccept = "visit_accept";
  static const String startTravelTime = "start travel time";
  static const String geofence = "geofence";
  static const String startWorkTime = "start work time";
  static const String endWorkManager = "end_work_manager";
  static const String requestForClosure = "request_for_closure";
  static const String requestForFwReassignment = "request_for_fw_reassignment";
  static const String changingTimeSlotNotifyToManager =
      "changing time-slot notify to manager";
  static const String visitReject = "visit_reject";
  static const String visitCancelled = "visit_cancelled";
  static const String remindMeLater = "remind_me_later";
  static const String geofenceExitManager = "geofence_exit_manager";
  static const String visitAssignmentNotifyToManager =
      "visit assignment notify to manager";
  static const String ticketDispatcherChanged = "ticket_dispatcher_changed";
  static const String actionForAcceptingClosureRequestToFieldRepresentative =
      "action for accepting closure request to field representative";
  static const String incomingVideoCall = "incoming_video_call";
  static const String agentReplyTicket = "agent_reply_ticket";
  static const String videoCallRejected = "video_call_rejected";
  static const String workEndSla = "work_end_sla";
  static const String visitReassignment = "visit_reassignment";
  static const String rescheduleRequest = "reschedule_request";
  static const String applyLeave = "apply_leave";
  static const String ticketStatusChanged = "ticket_status_changed";
  static const String rfcRequest = "rfc_request";
}
