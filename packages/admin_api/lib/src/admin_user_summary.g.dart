// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_user_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminUserSummary _$AdminUserSummaryFromJson(Map<String, dynamic> json) =>
    _AdminUserSummary(
      id: json['id'] as String,
      username: json['username'] as String,
      role: $enumDecode(_$AuthRoleEnumMap, json['role']),
      nickname: json['nickname'] as String?,
      publicCode: json['publicCode'] as String?,
      userTrack: json['userTrack'] as String?,
      cohort: (json['cohort'] as num?)?.toInt(),
      cohortOrder: (json['cohortOrder'] as num?)?.toInt(),
      forcePasswordChange: json['forcePasswordChange'] as bool?,
      inviteLink: json['inviteLink'] as String?,
      inviteExpiresAt: json['inviteExpiresAt'] as String?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$AdminUserSummaryToJson(_AdminUserSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'role': _$AuthRoleEnumMap[instance.role]!,
      'nickname': instance.nickname,
      'publicCode': instance.publicCode,
      'userTrack': instance.userTrack,
      'cohort': instance.cohort,
      'cohortOrder': instance.cohortOrder,
      'forcePasswordChange': instance.forcePasswordChange,
      'inviteLink': instance.inviteLink,
      'inviteExpiresAt': instance.inviteExpiresAt,
      'active': instance.active,
    };

const _$AuthRoleEnumMap = {
  AuthRole.user: 'user',
  AuthRole.organizer: 'organizer',
  AuthRole.admin: 'admin',
};
