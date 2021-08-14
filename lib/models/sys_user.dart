import 'package:flutter/foundation.dart';


@immutable
class SysUser {

  const SysUser({
    required this.userId,
    this.deptId,
    required this.userName,
    required this.nickName,
    this.userType,
    this.email,
    this.phonenumber,
    this.sex,
    this.avatar,
    this.password,
    this.status,
    this.delFlag,
    this.loginIp,
    this.loginDate,
    this.createBy,
    this.createTime,
    this.updateBy,
    this.updateTime,
    this.remark,
  });

  final int userId;
  final int? deptId;
  final String userName;
  final String nickName;
  final String? userType;
  final String? email;
  final String? phonenumber;
  final String? sex;
  final String? avatar;
  final String? password;
  final String? status;
  final String? delFlag;
  final String? loginIp;
  final DateTime? loginDate;
  final String? createBy;
  final DateTime? createTime;
  final String? updateBy;
  final DateTime? updateTime;
  final String? remark;

  factory SysUser.fromJson(Map<String,dynamic> json) => SysUser(
    userId: json['user_id'] as int,
    deptId: json['dept_id'] != null ? json['dept_id'] as int : null,
    userName: json['user_name'] as String,
    nickName: json['nick_name'] as String,
    userType: json['user_type'] != null ? json['user_type'] as String : null,
    email: json['email'] != null ? json['email'] as String : null,
    phonenumber: json['phonenumber'] != null ? json['phonenumber'] as String : null,
    sex: json['sex'] != null ? json['sex'] as String : null,
    avatar: json['avatar'] != null ? json['avatar'] as String : null,
    password: json['password'] != null ? json['password'] as String : null,
    status: json['status'] != null ? json['status'] as String : null,
    delFlag: json['del_flag'] != null ? json['del_flag'] as String : null,
    loginIp: json['login_ip'] != null ? json['login_ip'] as String : null,
    loginDate: json['login_date'] != null ? DateTime.parse(json['login_date'] as String) : null,
    createBy: json['create_by'] != null ? json['create_by'] as String : null,
    createTime: json['create_time'] != null ? DateTime.parse(json['create_time'] as String) : null,
    updateBy: json['update_by'] != null ? json['update_by'] as String : null,
    updateTime: json['update_time'] != null ? DateTime.parse(json['update_time'] as String) : null,
    remark: json['remark'] != null ? json['remark'] as String : null
  );
  
  Map<String, dynamic> toJson() => {
    'user_id': userId,
    'dept_id': deptId,
    'user_name': userName,
    'nick_name': nickName,
    'user_type': userType,
    'email': email,
    'phonenumber': phonenumber,
    'sex': sex,
    'avatar': avatar,
    'password': password,
    'status': status,
    'del_flag': delFlag,
    'login_ip': loginIp,
    'login_date': loginDate?.toIso8601String(),
    'create_by': createBy,
    'create_time': createTime?.toIso8601String(),
    'update_by': updateBy,
    'update_time': updateTime?.toIso8601String(),
    'remark': remark
  };

  SysUser clone() => SysUser(
    userId: userId,
    deptId: deptId,
    userName: userName,
    nickName: nickName,
    userType: userType,
    email: email,
    phonenumber: phonenumber,
    sex: sex,
    avatar: avatar,
    password: password,
    status: status,
    delFlag: delFlag,
    loginIp: loginIp,
    loginDate: loginDate,
    createBy: createBy,
    createTime: createTime,
    updateBy: updateBy,
    updateTime: updateTime,
    remark: remark
  );


  SysUser copyWith({
    int? userId,
    int? deptId,
    String? userName,
    String? nickName,
    String? userType,
    String? email,
    String? phonenumber,
    String? sex,
    String? avatar,
    String? password,
    String? status,
    String? delFlag,
    String? loginIp,
    DateTime? loginDate,
    String? createBy,
    DateTime? createTime,
    String? updateBy,
    DateTime? updateTime,
    String? remark
  }) => SysUser(
    userId: userId ?? this.userId,
    deptId: deptId ?? this.deptId,
    userName: userName ?? this.userName,
    nickName: nickName ?? this.nickName,
    userType: userType ?? this.userType,
    email: email ?? this.email,
    phonenumber: phonenumber ?? this.phonenumber,
    sex: sex ?? this.sex,
    avatar: avatar ?? this.avatar,
    password: password ?? this.password,
    status: status ?? this.status,
    delFlag: delFlag ?? this.delFlag,
    loginIp: loginIp ?? this.loginIp,
    loginDate: loginDate ?? this.loginDate,
    createBy: createBy ?? this.createBy,
    createTime: createTime ?? this.createTime,
    updateBy: updateBy ?? this.updateBy,
    updateTime: updateTime ?? this.updateTime,
    remark: remark ?? this.remark,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is SysUser && userId == other.userId && deptId == other.deptId && userName == other.userName && nickName == other.nickName && userType == other.userType && email == other.email && phonenumber == other.phonenumber && sex == other.sex && avatar == other.avatar && password == other.password && status == other.status && delFlag == other.delFlag && loginIp == other.loginIp && loginDate == other.loginDate && createBy == other.createBy && createTime == other.createTime && updateBy == other.updateBy && updateTime == other.updateTime && remark == other.remark;

  @override
  int get hashCode => userId.hashCode ^ deptId.hashCode ^ userName.hashCode ^ nickName.hashCode ^ userType.hashCode ^ email.hashCode ^ phonenumber.hashCode ^ sex.hashCode ^ avatar.hashCode ^ password.hashCode ^ status.hashCode ^ delFlag.hashCode ^ loginIp.hashCode ^ loginDate.hashCode ^ createBy.hashCode ^ createTime.hashCode ^ updateBy.hashCode ^ updateTime.hashCode ^ remark.hashCode;
}
