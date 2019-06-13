# openapi.api.DeviceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deviceAddDevice**](DeviceApi.md#deviceAddDevice) | **POST** /api/Device/{id}/Add | 
[**deviceChangeAnimation**](DeviceApi.md#deviceChangeAnimation) | **POST** /api/Device/{id}/ChangeAnimation | 
[**deviceChangeBrightness**](DeviceApi.md#deviceChangeBrightness) | **POST** /api/Device/{id}/ChangeBrightness | 
[**deviceChangeColor**](DeviceApi.md#deviceChangeColor) | **POST** /api/Device/{id}/ChangeColor | 
[**deviceChangeMode**](DeviceApi.md#deviceChangeMode) | **POST** /api/Device/{id}/ChangeMode | 
[**deviceChangeSpeed**](DeviceApi.md#deviceChangeSpeed) | **POST** /api/Device/{id}/ChangeSpeed | 
[**deviceGetPictures**](DeviceApi.md#deviceGetPictures) | **GET** /api/Device/Pictures | 
[**deviceGetSetting**](DeviceApi.md#deviceGetSetting) | **GET** /api/Device/{id}/GetSetting | 
[**deviceInfo**](DeviceApi.md#deviceInfo) | **GET** /api/Device/{id}/Info | 
[**devicePromptUpdate**](DeviceApi.md#devicePromptUpdate) | **POST** /api/Device/{id}/Update/{updateId} | 
[**deviceRemoveDevice**](DeviceApi.md#deviceRemoveDevice) | **DELETE** /api/Device/{id}/Remove | 
[**deviceRestart**](DeviceApi.md#deviceRestart) | **POST** /api/Device/{id}/Restart | 
[**deviceSetPicture**](DeviceApi.md#deviceSetPicture) | **POST** /api/Device/{id}/SetPicture | 
[**deviceShowQrCode**](DeviceApi.md#deviceShowQrCode) | **POST** /api/Device/{id}/ShowQrCode | 
[**deviceSleep**](DeviceApi.md#deviceSleep) | **POST** /api/Device/{id}/Sleep | 
[**deviceUpdates**](DeviceApi.md#deviceUpdates) | **GET** /api/Device/Updates | 


# **deviceAddDevice**
> DeviceSimpleDto deviceAddDevice(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new DeviceApi();
var id = id_example; // String | 

try { 
    var result = api_instance.deviceAddDevice(id);
    print(result);
} catch (e) {
    print("Exception when calling DeviceApi->deviceAddDevice: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | [default to null]

### Return type

[**DeviceSimpleDto**](DeviceSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceChangeAnimation**
> Object deviceChangeAnimation(id, smartHookahModelsParameterObjectsChangeAnimation)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new DeviceApi();
var id = id_example; // String | 
var smartHookahModelsParameterObjectsChangeAnimation = new SmartHookahModelsParameterObjectsChangeAnimation(); // SmartHookahModelsParameterObjectsChangeAnimation | 

try { 
    var result = api_instance.deviceChangeAnimation(id, smartHookahModelsParameterObjectsChangeAnimation);
    print(result);
} catch (e) {
    print("Exception when calling DeviceApi->deviceChangeAnimation: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | [default to null]
 **smartHookahModelsParameterObjectsChangeAnimation** | [**SmartHookahModelsParameterObjectsChangeAnimation**](SmartHookahModelsParameterObjectsChangeAnimation.md)|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceChangeBrightness**
> Object deviceChangeBrightness(id, smartHookahModelsParameterObjectsChangeBrightness)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new DeviceApi();
var id = id_example; // String | 
var smartHookahModelsParameterObjectsChangeBrightness = new SmartHookahModelsParameterObjectsChangeBrightness(); // SmartHookahModelsParameterObjectsChangeBrightness | 

try { 
    var result = api_instance.deviceChangeBrightness(id, smartHookahModelsParameterObjectsChangeBrightness);
    print(result);
} catch (e) {
    print("Exception when calling DeviceApi->deviceChangeBrightness: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | [default to null]
 **smartHookahModelsParameterObjectsChangeBrightness** | [**SmartHookahModelsParameterObjectsChangeBrightness**](SmartHookahModelsParameterObjectsChangeBrightness.md)|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceChangeColor**
> Object deviceChangeColor(id, smartHookahModelsParameterObjectsChangeColor)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new DeviceApi();
var id = id_example; // String | 
var smartHookahModelsParameterObjectsChangeColor = new SmartHookahModelsParameterObjectsChangeColor(); // SmartHookahModelsParameterObjectsChangeColor | 

try { 
    var result = api_instance.deviceChangeColor(id, smartHookahModelsParameterObjectsChangeColor);
    print(result);
} catch (e) {
    print("Exception when calling DeviceApi->deviceChangeColor: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | [default to null]
 **smartHookahModelsParameterObjectsChangeColor** | [**SmartHookahModelsParameterObjectsChangeColor**](SmartHookahModelsParameterObjectsChangeColor.md)|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceChangeMode**
> Object deviceChangeMode(id, body)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new DeviceApi();
var id = id_example; // String | 
var body = new int(); // int | 

try { 
    var result = api_instance.deviceChangeMode(id, body);
    print(result);
} catch (e) {
    print("Exception when calling DeviceApi->deviceChangeMode: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | [default to null]
 **body** | **int**|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceChangeSpeed**
> Object deviceChangeSpeed(id, smartHookahModelsParameterObjectsChangeSpeed)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new DeviceApi();
var id = id_example; // String | 
var smartHookahModelsParameterObjectsChangeSpeed = new SmartHookahModelsParameterObjectsChangeSpeed(); // SmartHookahModelsParameterObjectsChangeSpeed | 

try { 
    var result = api_instance.deviceChangeSpeed(id, smartHookahModelsParameterObjectsChangeSpeed);
    print(result);
} catch (e) {
    print("Exception when calling DeviceApi->deviceChangeSpeed: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | [default to null]
 **smartHookahModelsParameterObjectsChangeSpeed** | [**SmartHookahModelsParameterObjectsChangeSpeed**](SmartHookahModelsParameterObjectsChangeSpeed.md)|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceGetPictures**
> List<DeviceDevicePictureDto> deviceGetPictures()



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new DeviceApi();

try { 
    var result = api_instance.deviceGetPictures();
    print(result);
} catch (e) {
    print("Exception when calling DeviceApi->deviceGetPictures: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<DeviceDevicePictureDto>**](DeviceDevicePictureDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceGetSetting**
> DeviceSettingDto deviceGetSetting(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new DeviceApi();
var id = id_example; // String | 

try { 
    var result = api_instance.deviceGetSetting(id);
    print(result);
} catch (e) {
    print("Exception when calling DeviceApi->deviceGetSetting: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | [default to null]

### Return type

[**DeviceSettingDto**](DeviceSettingDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceInfo**
> SmartHookahControllersApiDeviceInfoResponse deviceInfo(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new DeviceApi();
var id = 56; // int | 

try { 
    var result = api_instance.deviceInfo(id);
    print(result);
} catch (e) {
    print("Exception when calling DeviceApi->deviceInfo: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]

### Return type

[**SmartHookahControllersApiDeviceInfoResponse**](SmartHookahControllersApiDeviceInfoResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **devicePromptUpdate**
> bool devicePromptUpdate(id, updateId)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new DeviceApi();
var id = 56; // int | 
var updateId = 56; // int | 

try { 
    var result = api_instance.devicePromptUpdate(id, updateId);
    print(result);
} catch (e) {
    print("Exception when calling DeviceApi->devicePromptUpdate: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **updateId** | **int**|  | [default to null]

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceRemoveDevice**
> DeviceSimpleDto deviceRemoveDevice(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new DeviceApi();
var id = id_example; // String | 

try { 
    var result = api_instance.deviceRemoveDevice(id);
    print(result);
} catch (e) {
    print("Exception when calling DeviceApi->deviceRemoveDevice: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | [default to null]

### Return type

[**DeviceSimpleDto**](DeviceSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceRestart**
> Object deviceRestart(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new DeviceApi();
var id = id_example; // String | 

try { 
    var result = api_instance.deviceRestart(id);
    print(result);
} catch (e) {
    print("Exception when calling DeviceApi->deviceRestart: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | [default to null]

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceSetPicture**
> bool deviceSetPicture(id, body)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new DeviceApi();
var id = 56; // int | 
var body = new int(); // int | 

try { 
    var result = api_instance.deviceSetPicture(id, body);
    print(result);
} catch (e) {
    print("Exception when calling DeviceApi->deviceSetPicture: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **body** | **int**|  | 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceShowQrCode**
> Object deviceShowQrCode(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new DeviceApi();
var id = id_example; // String | 

try { 
    var result = api_instance.deviceShowQrCode(id);
    print(result);
} catch (e) {
    print("Exception when calling DeviceApi->deviceShowQrCode: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | [default to null]

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceSleep**
> Object deviceSleep(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new DeviceApi();
var id = id_example; // String | 

try { 
    var result = api_instance.deviceSleep(id);
    print(result);
} catch (e) {
    print("Exception when calling DeviceApi->deviceSleep: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | [default to null]

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceUpdates**
> List<DeviceUpdateDto> deviceUpdates()



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new DeviceApi();

try { 
    var result = api_instance.deviceUpdates();
    print(result);
} catch (e) {
    print("Exception when calling DeviceApi->deviceUpdates: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<DeviceUpdateDto>**](DeviceUpdateDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

