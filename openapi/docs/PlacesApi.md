# openapi.api.PlacesApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**placesGetPlaceInfo**](PlacesApi.md#placesGetPlaceInfo) | **GET** /api/Places/GetPlaceInfo | 
[**placesGetPlaceMenu**](PlacesApi.md#placesGetPlaceMenu) | **GET** /api/Places/{id}/Menu | 
[**placesSearchNearby**](PlacesApi.md#placesSearchNearby) | **GET** /api/Places/SearchNearby | 


# **placesGetPlaceInfo**
> PlaceDto placesGetPlaceInfo(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PlacesApi();
var id = 56; // int | 

try { 
    var result = api_instance.placesGetPlaceInfo(id);
    print(result);
} catch (e) {
    print("Exception when calling PlacesApi->placesGetPlaceInfo: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]

### Return type

[**PlaceDto**](PlaceDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placesGetPlaceMenu**
> PlaceMenuDto placesGetPlaceMenu(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PlacesApi();
var id = 56; // int | 

try { 
    var result = api_instance.placesGetPlaceMenu(id);
    print(result);
} catch (e) {
    print("Exception when calling PlacesApi->placesGetPlaceMenu: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]

### Return type

[**PlaceMenuDto**](PlaceMenuDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placesSearchNearby**
> NearbyPlacesDto placesSearchNearby(page, pageSize, lng, lat)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PlacesApi();
var page = 56; // int | 
var pageSize = 56; // int | 
var lng = 3.4; // double | 
var lat = 3.4; // double | 

try { 
    var result = api_instance.placesSearchNearby(page, pageSize, lng, lat);
    print(result);
} catch (e) {
    print("Exception when calling PlacesApi->placesSearchNearby: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to null]
 **pageSize** | **int**|  | [optional] [default to null]
 **lng** | **double**|  | [optional] [default to null]
 **lat** | **double**|  | [optional] [default to null]

### Return type

[**NearbyPlacesDto**](NearbyPlacesDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

