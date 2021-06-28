# openapi.api.PlaceAdminApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**placeAdminChangeState**](PlaceAdminApi.md#placeadminchangestate) | **POST** /api/Admin/Places/{id}/ChangeState | 
[**placeAdminGetWaitingPlaces**](PlaceAdminApi.md#placeadmingetwaitingplaces) | **GET** /api/Admin/Places/Waiting | 


# **placeAdminChangeState**
> PlaceSimpleDto placeAdminChangeState(id, newState)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = PlaceAdminApi();
final id = 56; // int | 
final newState = 56; // int | 

try { 
    final result = api_instance.placeAdminChangeState(id, newState);
    print(result);
} catch (e) {
    print('Exception when calling PlaceAdminApi->placeAdminChangeState: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **newState** | **int**|  | 

### Return type

[**PlaceSimpleDto**](PlaceSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placeAdminGetWaitingPlaces**
> List<PlaceSimpleDto> placeAdminGetWaitingPlaces()



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = PlaceAdminApi();

try { 
    final result = api_instance.placeAdminGetWaitingPlaces();
    print(result);
} catch (e) {
    print('Exception when calling PlaceAdminApi->placeAdminGetWaitingPlaces: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<PlaceSimpleDto>**](PlaceSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

