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

final api = Openapi().getPlaceAdminApi();
final int id = 56; // int | 
final int newState = 56; // int | 

try {
    final response = api.placeAdminChangeState(id, newState);
    print(response);
} catch on DioError (e) {
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

final api = Openapi().getPlaceAdminApi();

try {
    final response = api.placeAdminGetWaitingPlaces();
    print(response);
} catch on DioError (e) {
    print('Exception when calling PlaceAdminApi->placeAdminGetWaitingPlaces: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List&lt;PlaceSimpleDto&gt;**](PlaceSimpleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

