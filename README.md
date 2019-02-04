# Manapipes flutter app

Crazy idea that make it true... write native app in flutter

To run :

Edit MapViewPlugin.kt : https://github.com/apptreesoftware/flutter_google_map_view/issues/129#issuecomment-436954546

To regenerate swagger
update /swagger/swagger.json

run:

openapi-generator generate -i swagger\swagger.json -g dart -DbrowserClient=false -o .\openapi

fix in priceGroup
price = new Map<String, double>.from(json['Price']);

zmenit getConstraintsForChild contraint 