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

final api_instance = DevicePresetApi();
final id = 56; // int | 

try { 
    final result = api_instance.devicePresetDeletePreset(id);
    print(result);
} catch (e) {
    print('Exception when calling DevicePresetApi->devicePresetDeletePreset: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**Object**](Object.md)

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

final api_instance = DevicePresetApi();
final id = 56; // int | 

try { 
    final result = api_instance.devicePresetGetPreset(id);
    print(result);
} catch (e) {
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

final api_instance = DevicePresetApi();

try { 
    final result = api_instance.devicePresetGetUserPresets();
    print(result);
} catch (e) {
    print('Exception when calling DevicePresetApi->devicePresetGetUserPresets: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<DevicePresetDto>**](DevicePresetDto.md)

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

final api_instance = DevicePresetApi();
final deviceId = deviceId_example; // String | 
final name = name_example; // String | 
final addToPerson = true; // bool | 
final setDefault = true; // bool | 

try { 
    final result = api_instance.devicePresetSaveDevicePreset(deviceId, name, addToPerson, setDefault);
    print(result);
} catch (e) {
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

final api_instance = DevicePresetApi();
final sessionCode = sessionCode_example; // String | 
final name = name_example; // String | 
final addToPerson = true; // bool | 
final setDefault = true; // bool | 

try { 
    final result = api_instance.devicePresetSaveSessionPreset(sessionCode, name, addToPerson, setDefault);
    print(result);
} catch (e) {
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

final api_instance = DevicePresetApi();
final presetId = 56; // int | 

try { 
    api_instance.devicePresetSetDefault(presetId);
} catch (e) {
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

final api_instance = DevicePresetApi();
final sessionId = sessionId_example; // String | 

try { 
    api_instance.devicePresetUseDefault(sessionId);
} catch (e) {
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

final api_instance = DevicePresetApi();
final sessionId = sessionId_example; // String | 
final presetId = 56; // int | 

try { 
    api_instance.devicePresetUsePreset(sessionId, presetId);
} catch (e) {
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

