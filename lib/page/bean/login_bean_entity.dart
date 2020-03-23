import 'package:wardrobe/generated/json/base/json_convert_content.dart';

class LoginBeanEntity with JsonConvert<LoginBeanEntity> {
	String error;
	String msg;
	bool valid;
}
