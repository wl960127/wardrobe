

import 'package:wardrobe/page/bean/login_bean_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (json == null) {
      return null;
    } else if (T.toString() == "LoginBeanEntity") {
      return LoginBeanEntity().fromJson(json) as T;
    } else {
      return json as T;
    }
  }
}
