# openapi.api.DeviceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deviceAddDevice**](DeviceApi.md#deviceadddevice) | **POST** /api/Device/{id}/Add | 
[**deviceChangeAnimation**](DeviceApi.md#devicechangeanimation) | **POST** /api/Device/{id}/ChangeAnimation | 
[**deviceChangeBrightness**](DeviceApi.md#devicechangebrightness) | **POST** /api/Device/{id}/ChangeBrightness | 
[**deviceChangeColor**](DeviceApi.md#devicechangecolor) | **POST** /api/Device/{id}/ChangeColor | 
[**deviceChangeMode**](DeviceApi.md#devicechangemode) | **POST** /api/Device/{id}/ChangeMode | 
[**deviceChangeName**](DeviceApi.md#devicechangename) | **POST** /api/Device/{id}/ChangeName | 
[**deviceChangeSpeed**](DeviceApi.md#devicechangespeed) | **POST** /api/Device/{id}/ChangeSpeed | 
[**deviceGetDeviceSessions**](DeviceApi.md#devicegetdevicesessions) | **GET** /api/Device/{id}/Sessions | 
[**deviceGetPictures**](DeviceApi.md#devicegetpictures) | **GET** /api/Device/Pictures | 
[**deviceGetSetting**](DeviceApi.md#devicegetsetting) | **GET** /api/Device/{id}/GetSetting | 
[**deviceInfo**](DeviceApi.md#deviceinfo) | **GET** /api/Device/{id}/Info | 
[**devicePing**](DeviceApi.md#deviceping) | **POST** /api/Device/{id}/Ping | 
[**devicePromptUpdate**](DeviceApi.md#devicepromptupdate) | **POST** /api/Device/{id}/Update/{updateId} | 
[**deviceRemoveDevice**](DeviceApi.md#deviceremovedevice) | **DELETE** /api/Device/{id}/Remove | 
[**deviceRestart**](DeviceApi.md#devicerestart) | **POST** /api/Device/{id}/Restart | 
[**deviceSetPicture**](DeviceApi.md#devicesetpicture) | **POST** /api/Device/{id}/SetPicture | 
[**deviceShowQrCode**](DeviceApi.md#deviceshowqrcode) | **POST** /api/Device/{id}/ShowQrCode | 
[**deviceSleep**](DeviceApi.md#devicesleep) | **POST** /api/Device/{id}/Sleep | 
[**deviceUpdates**](DeviceApi.md#deviceupdates) | **GET** /api/Device/Updates | 


# **deviceAddDevice**
> DeviceSimpleDto deviceAddDevice(id, code, newName)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = DeviceApi();
final id = id_example; // String | 
final code = code_example; // String | 
final newName = newName_example; // String | 

try { 
    final result = api_instance.deviceAddDevice(id, code, newName);
    print(result);
} catch (e) {
    print('Exception when calling DeviceApi->deviceAddDevice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **code** | **String**|  | 
 **newName** | **String**|  | 

### Return type

[**DeviceSimpleDto**](DeviceSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceChangeAnimation**
> Object deviceChangeAnimation(id, model)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = DeviceApi();
final id = id_example; // String | 
final model = SmartHookahModelsParameterObjectsChangeAnimation(); // SmartHookahModelsParameterObjectsChangeAnimation | 

try { 
    final result = api_instance.deviceChangeAnimation(id, model);
    print(result);
} catch (e) {
    print('Exception when calling DeviceApi->deviceChangeAnimation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **model** | [**SmartHookahModelsParameterObjectsChangeAnimation**](SmartHookahModelsParameterObjectsChangeAnimation.md)|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, multipart/form-data, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceChangeBrightness**
> Object deviceChangeBrightness(id, model)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = DeviceApi();
final id = id_example; // String | 
final model = SmartHookahModelsParameterObjectsChangeBrightness(); // SmartHookahModelsParameterObjectsChangeBrightness | 

try { 
    final result = api_instance.deviceChangeBrightness(id, model);
    print(result);
} catch (e) {
    print('Exception when calling DeviceApi->deviceChangeBrightness: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **model** | [**SmartHookahModelsParameterObjectsChangeBrightness**](SmartHookahModelsParameterObjectsChangeBrightness.md)|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, multipart/form-data, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceChangeColor**
> Object deviceChangeColor(id, model)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = DeviceApi();
final id = id_example; // String | 
final model = SmartHookahModelsParameterObjectsChangeColor(); // SmartHookahModelsParameterObjectsChangeColor | 

try { 
    final result = api_instance.deviceChangeColor(id, model);
    print(result);
} catch (e) {
    print('Exception when calling DeviceApi->deviceChangeColor: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **model** | [**SmartHookahModelsParameterObjectsChangeColor**](SmartHookahModelsParameterObjectsChangeColor.md)|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, multipart/form-data, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceChangeMode**
> Object deviceChangeMode(id, mode)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = DeviceApi();
final id = id_example; // String | 
final mode = int(); // int | 

try { 
    final result = api_instance.deviceChangeMode(id, mode);
    print(result);
} catch (e) {
    print('Exception when calling DeviceApi->deviceChangeMode: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **mode** | **int**|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, multipart/form-data, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceChangeName**
> DeviceSimpleDto deviceChangeName(id, newName)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = DeviceApi();
final id = id_example; // String | 
final newName = newName_example; // String | 

try { 
    final result = api_instance.deviceChangeName(id, newName);
    print(result);
} catch (e) {
    print('Exception when calling DeviceApi->deviceChangeName: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **newName** | **String**|  | 

### Return type

[**DeviceSimpleDto**](DeviceSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceChangeSpeed**
> Object deviceChangeSpeed(id, model)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = DeviceApi();
final id = id_example; // String | 
final model = SmartHookahModelsParameterObjectsChangeSpeed(); // SmartHookahModelsParameterObjectsChangeSpeed | 

try { 
    final result = api_instance.deviceChangeSpeed(id, model);
    print(result);
} catch (e) {
    print('Exception when calling DeviceApi->deviceChangeSpeed: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **model** | [**SmartHookahModelsParameterObjectsChangeSpeed**](SmartHookahModelsParameterObjectsChangeSpeed.md)|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, multipart/form-data, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceGetDeviceSessions**
> List<SmokeSessionSimpleDto> deviceGetDeviceSessions(id, pageSize, page)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = DeviceApi();
final id = 56; // int | 
final pageSize = 56; // int | 
final page = 56; // int | 

try { 
    final result = api_instance.deviceGetDeviceSessions(id, pageSize, page);
    print(result);
} catch (e) {
    print('Exception when calling DeviceApi->deviceGetDeviceSessions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **pageSize** | **int**|  | [optional] 
 **page** | **int**|  | [optional] 

### Return type

[**List<SmokeSessionSimpleDto>**](SmokeSessionSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceGetPictures**
> List<DeviceDevicePictureDto> deviceGetPictures()



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = DeviceApi();

try { 
    final result = api_instance.deviceGetPictures();
    print(result);
} catch (e) {
    print('Exception when calling DeviceApi->deviceGetPictures: $e\n');
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
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceGetSetting**
> DeviceSettingDto deviceGetSetting(id)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = DeviceApi();
final id = id_example; // String | 

try { 
    final result = api_instance.deviceGetSetting(id);
    print(result);
} catch (e) {
    print('Exception when calling DeviceApi->deviceGetSetting: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**DeviceSettingDto**](DeviceSettingDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceInfo**
> SmartHookahControllersApiDeviceInfoResponse deviceInfo(id)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = DeviceApi();
final id = 56; // int | 

try { 
    final result = api_instance.deviceInfo(id);
    print(result);
} catch (e) {
    print('Exception when calling DeviceApi->deviceInfo: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**SmartHookahControllersApiDeviceInfoResponse**](SmartHookahControllersApiDeviceInfoResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **devicePing**
> Object devicePing(id)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = DeviceApi();
final id = id_example; // String | 

try { 
    final result = api_instance.devicePing(id);
    print(result);
} catch (e) {
    print('Exception when calling DeviceApi->devicePing: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **devicePromptUpdate**
> bool devicePromptUpdate(id, updateId)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = DeviceApi();
final id = 56; // int | 
final updateId = 56; // int | 

try { 
    final result = api_instance.devicePromptUpdate(id, updateId);
    print(result);
} catch (e) {
    print('Exception when calling DeviceApi->devicePromptUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **updateId** | **int**|  | 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceRemoveDevice**
> DeviceSimpleDto deviceRemoveDevice(id)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = DeviceApi();
final id = id_example; // String | 

try { 
    final result = api_instance.deviceRemoveDevice(id);
    print(result);
} catch (e) {
    print('Exception when calling DeviceApi->deviceRemoveDevice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**DeviceSimpleDto**](DeviceSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceRestart**
> Object deviceRestart(id)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = DeviceApi();
final id = id_example; // String | 

try { 
    final result = api_instance.deviceRestart(id);
    print(result);
} catch (e) {
    print('Exception when calling DeviceApi->deviceRestart: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceSetPicture**
> bool deviceSetPicture(id, pictureId)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = DeviceApi();
final id = 56; // int | 
final pictureId = int(); // int | 

try { 
    final result = api_instance.deviceSetPicture(id, pictureId);
    print(result);
} catch (e) {
    print('Exception when calling DeviceApi->deviceSetPicture: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **pictureId** | **int**|  | 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, multipart/form-data, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceShowQrCode**
> Object deviceShowQrCode(id)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = DeviceApi();
final id = id_example; // String | 

try { 
    final result = api_instance.deviceShowQrCode(id);
    print(result);
} catch (e) {
    print('Exception when calling DeviceApi->deviceShowQrCode: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceSleep**
> Object deviceSleep(id)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = DeviceApi();
final id = id_example; // String | 

try { 
    final result = api_instance.deviceSleep(id);
    print(result);
} catch (e) {
    print('Exception when calling DeviceApi->deviceSleep: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceUpdates**
> List<DeviceUpdateDto> deviceUpdates()



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = DeviceApi();

try { 
    final result = api_instance.deviceUpdates();
    print(result);
} catch (e) {
    print('Exception when calling DeviceApi->deviceUpdates: $e\n');
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
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

