# openapi.api.DevicePresetApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**devicePresetDeletePreset**](DevicePresetApi.md#devicepresetdeletepreset) | **DELETE** /api/Device/Preset/{id}/Delete | 
[**devicePresetGetPreset**](DevicePresetApi.md#devicepresetgetpreset) | **GET** /api/Device/Preset/{id}/GetPreset | 
[**devicePresetGetUserPresets**](DevicePresetApi.md#devicepresetgetuserpresets) | **GET** /api/Device/Preset/GetUserPresets | 
[**devicePresetSaveDevicePreset**](DevicePresetApi.md#devicepresetsavedevicepreset) | **POST** /api/Device/Preset/SavePresetFromDevice/{deviceId} | 
[**devicePresetSaveSessionPreset**](DevicePresetApi.md#devicepresetsavesessionpreset) | **POST** /api/Device/Preset/{sessionCode}/SavePresetFromSession | 
[**devicePresetSetDefault**](DevicePresetApi.md#devicepresetsetdefault) | **POST** /api/Device/Preset/{presetId}/SetDefault | 
[**devicePresetUseDefault**](DevicePresetApi.md#devicepresetusedefault) | **POST** /api/Device/Preset/UseDefault/{sessionId} | 
[**devicePresetUsePreset**](DevicePresetApi.md#devicepresetusepreset) | **POST** /api/Device/Preset/{presetId}/Use/{sessionId} | 


# **devicePresetDeletePreset**
> Object devicePresetDeletePreset(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDevicePresetApi();
final int id = 56; // int | 

try {
    final response = api.devicePresetDeletePreset(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DevicePresetApi->devicePresetDeletePreset: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **devicePresetGetPreset**
> DevicePresetDto devicePresetGetPreset(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDevicePresetApi();
final int id = 56; // int | 

try {
    final response = api.devicePresetGetPreset(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DevicePresetApi->devicePresetGetPreset: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**DevicePresetDto**](DevicePresetDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **devicePresetGetUserPresets**
> List<DevicePresetDto> devicePresetGetUserPresets()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDevicePresetApi();

try {
    final response = api.devicePresetGetUserPresets();
    print(response);
} catch on DioError (e) {
    print('Exception when calling DevicePresetApi->devicePresetGetUserPresets: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List&lt;DevicePresetDto&gt;**](DevicePresetDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **devicePresetSaveDevicePreset**
> DevicePresetDto devicePresetSaveDevicePreset(deviceId, name, addToPerson, setDefault)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDevicePresetApi();
final String deviceId = deviceId_example; // String | 
final String name = name_example; // String | 
final bool addToPerson = true; // bool | 
final bool setDefault = true; // bool | 

try {
    final response = api.devicePresetSaveDevicePreset(deviceId, name, addToPerson, setDefault);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DevicePresetApi->devicePresetSaveDevicePreset: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **String**|  | 
 **name** | **String**|  | 
 **addToPerson** | **bool**|  | [optional] 
 **setDefault** | **bool**|  | [optional] 

### Return type

[**DevicePresetDto**](DevicePresetDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **devicePresetSaveSessionPreset**
> DevicePresetDto devicePresetSaveSessionPreset(sessionCode, name, addToPerson, setDefault)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDevicePresetApi();
final String sessionCode = sessionCode_example; // String | 
final String name = name_example; // String | 
final bool addToPerson = true; // bool | 
final bool setDefault = true; // bool | 

try {
    final response = api.devicePresetSaveSessionPreset(sessionCode, name, addToPerson, setDefault);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DevicePresetApi->devicePresetSaveSessionPreset: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionCode** | **String**|  | 
 **name** | **String**|  | 
 **addToPerson** | **bool**|  | [optional] 
 **setDefault** | **bool**|  | [optional] 

### Return type

[**DevicePresetDto**](DevicePresetDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **devicePresetSetDefault**
> devicePresetSetDefault(presetId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDevicePresetApi();
final int presetId = 56; // int | 

try {
    api.devicePresetSetDefault(presetId);
} catch on DioError (e) {
    print('Exception when calling DevicePresetApi->devicePresetSetDefault: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **presetId** | **int**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **devicePresetUseDefault**
> devicePresetUseDefault(sessionId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDevicePresetApi();
final String sessionId = sessionId_example; // String | 

try {
    api.devicePresetUseDefault(sessionId);
} catch on DioError (e) {
    print('Exception when calling DevicePresetApi->devicePresetUseDefault: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **devicePresetUsePreset**
> devicePresetUsePreset(sessionId, presetId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDevicePresetApi();
final String sessionId = sessionId_example; // String | 
final int presetId = 56; // int | 

try {
    api.devicePresetUsePreset(sessionId, presetId);
} catch on DioError (e) {
    print('Exception when calling DevicePresetApi->devicePresetUsePreset: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionId** | **String**|  | 
 **presetId** | **int**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

