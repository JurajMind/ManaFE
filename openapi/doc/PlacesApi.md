# openapi.api.PlacesApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**placesAddFlags**](PlacesApi.md#placesaddflags) | **PUT** /api/Places/{placeId}/AddFlags | 
[**placesAddPlace**](PlacesApi.md#placesaddplace) | **POST** /api/Places/Add | 
[**placesFixLocation**](PlacesApi.md#placesfixlocation) | **GET** /api/Places/FixLocation | 
[**placesGetDashboardData**](PlacesApi.md#placesgetdashboarddata) | **GET** /api/Places/{placeId}/DashboardData | 
[**placesGetPlaceInfo**](PlacesApi.md#placesgetplaceinfo) | **GET** /api/Places/GetPlaceInfo | 
[**placesGetPlaceMenu**](PlacesApi.md#placesgetplacemenu) | **GET** /api/Places/{id}/Menu | 
[**placesImportPlaces**](PlacesApi.md#placesimportplaces) | **POST** /api/Places/Import | 
[**placesImportPlacesFromMap**](PlacesApi.md#placesimportplacesfrommap) | **POST** /api/Places/ImportMap | 
[**placesSearchNearby**](PlacesApi.md#placessearchnearby) | **GET** /api/Places/SearchNearby | 


# **placesAddFlags**
> PlaceDto placesAddFlags(placeId, flags)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = PlacesApi();
final placeId = 56; // int | 
final flags = [List<String>()]; // List<String> | 

try { 
    final result = api_instance.placesAddFlags(placeId, flags);
    print(result);
} catch (e) {
    print('Exception when calling PlacesApi->placesAddFlags: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **placeId** | **int**|  | 
 **flags** | [**List<String>**](String.md)|  | 

### Return type

[**PlaceDto**](PlaceDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, multipart/form-data, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placesAddPlace**
> PlaceDto placesAddPlace(importedPlace)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = PlacesApi();
final importedPlace = PlaceDto(); // PlaceDto | 

try { 
    final result = api_instance.placesAddPlace(importedPlace);
    print(result);
} catch (e) {
    print('Exception when calling PlacesApi->placesAddPlace: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **importedPlace** | [**PlaceDto**](PlaceDto.md)|  | 

### Return type

[**PlaceDto**](PlaceDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, multipart/form-data, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placesFixLocation**
> placesFixLocation()



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = PlacesApi();

try { 
    api_instance.placesFixLocation();
} catch (e) {
    print('Exception when calling PlacesApi->placesFixLocation: $e\n');
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

final api_instance = PlacesApi();
final placeId = 56; // int | 

try { 
    final result = api_instance.placesGetDashboardData(placeId);
    print(result);
} catch (e) {
    print('Exception when calling PlacesApi->placesGetDashboardData: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **placeId** | **int**|  | 

### Return type

[**PlacesPlaceDashboardDto**](PlacesPlaceDashboardDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placesGetPlaceInfo**
> PlaceDto placesGetPlaceInfo(id)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = PlacesApi();
final id = 56; // int | 

try { 
    final result = api_instance.placesGetPlaceInfo(id);
    print(result);
} catch (e) {
    print('Exception when calling PlacesApi->placesGetPlaceInfo: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**PlaceDto**](PlaceDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placesGetPlaceMenu**
> PlaceMenuDto placesGetPlaceMenu(id)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = PlacesApi();
final id = 56; // int | 

try { 
    final result = api_instance.placesGetPlaceMenu(id);
    print(result);
} catch (e) {
    print('Exception when calling PlacesApi->placesGetPlaceMenu: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**PlaceMenuDto**](PlaceMenuDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placesImportPlaces**
> Object placesImportPlaces()



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = PlacesApi();

try { 
    final result = api_instance.placesImportPlaces();
    print(result);
} catch (e) {
    print('Exception when calling PlacesApi->placesImportPlaces: $e\n');
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
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placesImportPlacesFromMap**
> Object placesImportPlacesFromMap()



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = PlacesApi();

try { 
    final result = api_instance.placesImportPlacesFromMap();
    print(result);
} catch (e) {
    print('Exception when calling PlacesApi->placesImportPlacesFromMap: $e\n');
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
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placesSearchNearby**
> NearbyPlacesDto placesSearchNearby(page, pageSize, lat, lng, radius)



### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = PlacesApi();
final page = 56; // int | 
final pageSize = 56; // int | 
final lat = 1.2; // double | 
final lng = 1.2; // double | 
final radius = 3.4; // double | 

try { 
    final result = api_instance.placesSearchNearby(page, pageSize, lat, lng, radius);
    print(result);
} catch (e) {
    print('Exception when calling PlacesApi->placesSearchNearby: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] 
 **pageSize** | **int**|  | [optional] 
 **lat** | **double**|  | [optional] 
 **lng** | **double**|  | [optional] 
 **radius** | **double**|  | [optional] 

### Return type

[**NearbyPlacesDto**](NearbyPlacesDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

