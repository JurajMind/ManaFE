# Manapipes flutter app

Crazy idea that make it true... write native app in flutter

To run :

To regenerate swagger
update /swagger/swagger.json

run:

openapi-generator generate -i swagger\swagger.json -g dart -DbrowserClient=false -o .\openapi

fix in priceGroup
price = new Map<String, double>.from(json['Price']);

zmenit getConstraintsForChild contraint
