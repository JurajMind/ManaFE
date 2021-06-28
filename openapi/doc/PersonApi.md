# openapi.api.PersonApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**personAddMyGear**](PersonApi.md#personaddmygear) | **POST** /api/Person/MyGear/{id}/Add | 
[**personAddNotificationToken**](PersonApi.md#personaddnotificationtoken) | **PUT** /api/Person/NotificationToken | 
[**personAssignSession**](PersonApi.md#personassignsession) | **POST** /api/Person/AssignSession/{id} | 
[**personDeleteMyGear**](PersonApi.md#persondeletemygear) | **POST** /api/Person/MyGear/{id}/Delete | 
[**personGetPersonActiveData**](PersonApi.md#persongetpersonactivedata) | **GET** /api/Person/InitData | 
[**personGetPersonDevices**](PersonApi.md#persongetpersondevices) | **GET** /api/Person/Devices | 
[**personGetPersonInfo**](PersonApi.md#persongetpersoninfo) | **GET** /api/Person/Info | 
[**personGetPersonSessions**](PersonApi.md#persongetpersonsessions) | **GET** /api/Person/Sessions | 
[**personGetRecentAccessories**](PersonApi.md#persongetrecentaccessories) | **GET** /api/Person/MyGear/Used/{sessionCount} | 
[**personMyGear**](PersonApi.md#personmygear) | **GET** /api/Person/MyGear | 
[**personTestNotification**](PersonApi.md#persontestnotification) | **POST** /api/Person/TestNotification | 
[**personUnAssignSession**](PersonApi.md#personunassignsession) | **POST** /api/Person/UnAssignSession/{id} | 


# **personAddMyGear**
> PipeAccesorySimpleDto personAddMyGear(id, count)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = PersonApi();
final id = 56; // int | 
final count = 56; // int | 

try { 
    final result = api_instance.personAddMyGear(id, count);
    print(result);
} catch (e) {
    print('Exception when calling PersonApi->personAddMyGear: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **count** | **int**|  | [optional] 

### Return type

[**PipeAccesorySimpleDto**](PipeAccesorySimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **personAddNotificationToken**
> personAddNotificationToken(token)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = PersonApi();
final token = token_example; // String | 

try { 
    api_instance.personAddNotificationToken(token);
} catch (e) {
    print('Exception when calling PersonApi->personAddNotificationToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **token** | **String**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **personAssignSession**
> SmokeSessionSimpleDto personAssignSession(id)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = PersonApi();
final id = 56; // int | 

try { 
    final result = api_instance.personAssignSession(id);
    print(result);
} catch (e) {
    print('Exception when calling PersonApi->personAssignSession: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**SmokeSessionSimpleDto**](SmokeSessionSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **personDeleteMyGear**
> bool personDeleteMyGear(id, count)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = PersonApi();
final id = 56; // int | 
final count = 56; // int | 

try { 
    final result = api_instance.personDeleteMyGear(id, count);
    print(result);
} catch (e) {
    print('Exception when calling PersonApi->personDeleteMyGear: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **count** | **int**|  | [optional] 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **personGetPersonActiveData**
> PersonActiveDataDto personGetPersonActiveData()



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = PersonApi();

try { 
    final result = api_instance.personGetPersonActiveData();
    print(result);
} catch (e) {
    print('Exception when calling PersonApi->personGetPersonActiveData: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**PersonActiveDataDto**](PersonActiveDataDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **personGetPersonDevices**
> List<DeviceSimpleDto> personGetPersonDevices()



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = PersonApi();

try { 
    final result = api_instance.personGetPersonDevices();
    print(result);
} catch (e) {
    print('Exception when calling PersonApi->personGetPersonDevices: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<DeviceSimpleDto>**](DeviceSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **personGetPersonInfo**
> PersonInfoDto personGetPersonInfo()



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = PersonApi();

try { 
    final result = api_instance.personGetPersonInfo();
    print(result);
} catch (e) {
    print('Exception when calling PersonApi->personGetPersonInfo: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**PersonInfoDto**](PersonInfoDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **personGetPersonSessions**
> List<SmokeSessionSimpleDto> personGetPersonSessions()



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = PersonApi();

try { 
    final result = api_instance.personGetPersonSessions();
    print(result);
} catch (e) {
    print('Exception when calling PersonApi->personGetPersonSessions: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<SmokeSessionSimpleDto>**](SmokeSessionSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **personGetRecentAccessories**
> List<PipeAccesorySimpleDto> personGetRecentAccessories(sessionCount)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = PersonApi();
final sessionCount = 56; // int | 

try { 
    final result = api_instance.personGetRecentAccessories(sessionCount);
    print(result);
} catch (e) {
    print('Exception when calling PersonApi->personGetRecentAccessories: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionCount** | **int**|  | 

### Return type

[**List<PipeAccesorySimpleDto>**](PipeAccesorySimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **personMyGear**
> List<PipeAccesorySimpleDto> personMyGear(type)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = PersonApi();
final type = type_example; // String | 

try { 
    final result = api_instance.personMyGear(type);
    print(result);
} catch (e) {
    print('Exception when calling PersonApi->personMyGear: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | **String**|  | [optional] 

### Return type

[**List<PipeAccesorySimpleDto>**](PipeAccesorySimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **personTestNotification**
> personTestNotification()



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = PersonApi();

try { 
    api_instance.personTestNotification();
} catch (e) {
    print('Exception when calling PersonApi->personTestNotification: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **personUnAssignSession**
> bool personUnAssignSession(id)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = PersonApi();
final id = 56; // int | 

try { 
    final result = api_instance.personUnAssignSession(id);
    print(result);
} catch (e) {
    print('Exception when calling PersonApi->personUnAssignSession: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

