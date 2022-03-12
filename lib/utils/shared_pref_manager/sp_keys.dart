import 'package:flutter/foundation.dart';

enum SPKeys {
  loginUserData,
  verifyEmail,
  instanceId,
  fcmToken,
  isFirst,
  googleAccessToken,
  googleRefreshToken,
  isGoogleSyncEnabled,
  msAccessToken,
  msRefreshToken,
  msTokenExpirationDate,
  isMsSyncEnabled,
  selectedLanguage,
  isOptimiseRoute,
  isSendLog,
}

extension SPKeysExtensions on SPKeys {
  String get value => describeEnum(this);
}
