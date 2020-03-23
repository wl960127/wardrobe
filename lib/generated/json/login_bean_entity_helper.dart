import 'package:wardrobe/page/bean/login_bean_entity.dart';

loginBeanEntityFromJson(LoginBeanEntity data, Map<String, dynamic> json) {
	if (json['error'] != null) {
		data.error = json['error']?.toString();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['valid'] != null) {
		data.valid = json['valid'];
	}
	return data;
}

Map<String, dynamic> loginBeanEntityToJson(LoginBeanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['error'] = entity.error;
	data['msg'] = entity.msg;
	data['valid'] = entity.valid;
	return data;
}