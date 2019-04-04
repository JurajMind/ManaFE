# openapi.api.PlacesApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost:44324*

Method | HTTP request | Description
------------- | ------------- | -------------
[**placesAddFlags**](PlacesApi.md#placesAddFlags) | **PUT** /api/Places/{placeId}/AddFlags | 
[**placesFixLocation**](PlacesApi.md#placesFixLocation) | **GET** /api/Places/FixLocation | 
[**placesGetDashboardData**](PlacesApi.md#placesGetDashboardData) | **GET** /api/Places/{placeId}/DashboardData | 
[**placesGetPlaceInfo**](PlacesApi.md#placesGetPlaceInfo) | **GET** /api/Places/GetPlaceInfo | 
[**placesGetPlaceMenu**](PlacesApi.md#placesGetPlaceMenu) | **GET** /api/Places/{id}/Menu | 
[**placesImportPlaces**](PlacesApi.md#placesImportPlaces) | **POST** /api/Places/Import | 
[**placesImportPlacesFromMap**](PlacesApi.md#placesImportPlacesFromMap) | **POST** /api/Places/ImportMap | 
[**placesSearchNearby**](PlacesApi.md#placesSearchNearby) | **GET** /api/Places/SearchNearby | 


# **placesAddFlags**
> PlaceDto placesAddFlags(placeId, requestBody)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PlacesApi();
var placeId = 56; // int | 
var requestBody = [new List&lt;String&gt;()]; // List<String> | 

try { 
    var result = api_instance.placesAddFlags(placeId, requestBody);
    print(result);
} catch (e) {
    print("Exception when calling PlacesApi->placesAddFlags: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **placeId** | **int**|  | [default to null]
 **requestBody** | [**List&lt;String&gt;**](List.md)|  | 

### Return type

[**PlaceDto**](PlaceDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placesFixLocation**
> placesFixLocation()



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PlacesApi();

try { 
    api_instance.placesFixLocation();
} catch (e) {
    print("Exception when calling PlacesApi->placesFixLocation: $e\n");
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

# **placesGetDashboardData**
> PlacesPlaceDashboardDto placesGetDashboardData(placeId)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PlacesApi();
var placeId = 56; // int | 

try { 
    var result = api_instance.placesGetDashboardData(placeId);
    print(result);
} catch (e) {
    print("Exception when calling PlacesApi->placesGetDashboardData: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **placeId** | **int**|  | [default to null]

### Return type

[**PlacesPlaceDashboardDto**](PlacesPlaceDashboardDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

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

# **placesImportPlaces**
> Object placesImportPlaces()



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PlacesApi();

try { 
    var result = api_instance.placesImportPlaces();
    print(result);
} catch (e) {
    print("Exception when calling PlacesApi->placesImportPlaces: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placesImportPlacesFromMap**
> Object placesImportPlacesFromMap()



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PlacesApi();

try { 
    var result = api_instance.placesImportPlacesFromMap();
    print(result);
} catch (e) {
    print("Exception when calling PlacesApi->placesImportPlacesFromMap: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placesSearchNearby**
> NearbyPlacesDto placesSearchNearby(page, pageSize, lat, lng, radius)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PlacesApi();
var page = 56; // int | 
var pageSize = 56; // int | 
var lat = 1.2; // double | 
var lng = 1.2; // double | 
var radius = 3.4; // double | 

try { 
    var result = api_instance.placesSearchNearby(page, pageSize, lat, lng, radius);
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
 **lat** | **double**|  | [optional] [default to null]
 **lng** | **double**|  | [optional] [default to null]
 **radius** | **double**|  | [optional] [default to null]

### Return type

[**NearbyPlacesDto**](NearbyPlacesDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

