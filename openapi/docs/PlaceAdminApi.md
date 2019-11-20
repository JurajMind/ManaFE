# openapi.api.PlaceAdminApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**placeAdminChangeState**](PlaceAdminApi.md#placeAdminChangeState) | **POST** /api/Admin/Places/{id}/ChangeState | 
[**placeAdminGetWaitingPlaces**](PlaceAdminApi.md#placeAdminGetWaitingPlaces) | **GET** /api/Admin/Places/Waiting | 


# **placeAdminChangeState**
> PlaceSimpleDto placeAdminChangeState(id, newState)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PlaceAdminApi();
var id = 56; // int | 
var newState = 56; // int | 

try { 
    var result = api_instance.placeAdminChangeState(id, newState);
    print(result);
} catch (e) {
    print("Exception when calling PlaceAdminApi->placeAdminChangeState: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **newState** | **int**|  | [default to null]

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

var api_instance = new PlaceAdminApi();

try { 
    var result = api_instance.placeAdminGetWaitingPlaces();
    print(result);
} catch (e) {
    print("Exception when calling PlaceAdminApi->placeAdminGetWaitingPlaces: $e\n");
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

