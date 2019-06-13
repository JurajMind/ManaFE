# openapi.api.ReservationApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**reservationAddLateTime**](ReservationApi.md#reservationAddLateTime) | **POST** /api/Reservations/{id}/AddLateTime | 
[**reservationAddTable**](ReservationApi.md#reservationAddTable) | **POST** /api/Reservations/{id}/AddTable | 
[**reservationCancelReservation**](ReservationApi.md#reservationCancelReservation) | **POST** /api/Reservations/{id}/Cancel | 
[**reservationCreate**](ReservationApi.md#reservationCreate) | **POST** /api/Reservations/Create | 
[**reservationGetManagereservationsInfo**](ReservationApi.md#reservationGetManagereservationsInfo) | **GET** /api/Reservations/{id}/Manage | 
[**reservationGetPersonReservations**](ReservationApi.md#reservationGetPersonReservations) | **GET** /api/Reservations/Person | 
[**reservationGetReservationDetail**](ReservationApi.md#reservationGetReservationDetail) | **GET** /api/Reservations/{id}/Detail | 
[**reservationGetReservationUsage**](ReservationApi.md#reservationGetReservationUsage) | **GET** /api/Reservations/{id}/Usage | 
[**reservationGetReservations**](ReservationApi.md#reservationGetReservations) | **GET** /api/Reservations/Reservations | 
[**reservationRemoveTable**](ReservationApi.md#reservationRemoveTable) | **DELETE** /api/Reservations/{id}/RemoveTable | 
[**reservationUpdateReservationState**](ReservationApi.md#reservationUpdateReservationState) | **POST** /api/Reservations/{id}/UpdateState | 


# **reservationAddLateTime**
> PlacesReservationsReservationDto reservationAddLateTime(id, body)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ReservationApi();
var id = 56; // int | 
var body = new int(); // int | 

try { 
    var result = api_instance.reservationAddLateTime(id, body);
    print(result);
} catch (e) {
    print("Exception when calling ReservationApi->reservationAddLateTime: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **body** | **int**|  | 

### Return type

[**PlacesReservationsReservationDto**](PlacesReservationsReservationDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationAddTable**
> PlacesReservationsReservationDto reservationAddTable(id, body)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ReservationApi();
var id = 56; // int | 
var body = new int(); // int | 

try { 
    var result = api_instance.reservationAddTable(id, body);
    print(result);
} catch (e) {
    print("Exception when calling ReservationApi->reservationAddTable: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **body** | **int**|  | 

### Return type

[**PlacesReservationsReservationDto**](PlacesReservationsReservationDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationCancelReservation**
> bool reservationCancelReservation(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ReservationApi();
var id = 56; // int | 

try { 
    var result = api_instance.reservationCancelReservation(id);
    print(result);
} catch (e) {
    print("Exception when calling ReservationApi->reservationCancelReservation: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationCreate**
> PlacesReservationsReservationDto reservationCreate(placesReservationsReservationDto)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ReservationApi();
var placesReservationsReservationDto = new PlacesReservationsReservationDto(); // PlacesReservationsReservationDto | 

try { 
    var result = api_instance.reservationCreate(placesReservationsReservationDto);
    print(result);
} catch (e) {
    print("Exception when calling ReservationApi->reservationCreate: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **placesReservationsReservationDto** | [**PlacesReservationsReservationDto**](PlacesReservationsReservationDto.md)|  | 

### Return type

[**PlacesReservationsReservationDto**](PlacesReservationsReservationDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationGetManagereservationsInfo**
> PlacesReservationsReservationManageDto reservationGetManagereservationsInfo(id, date)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ReservationApi();
var id = 56; // int | 
var date = 2013-10-20T19:20:30+01:00; // DateTime | 

try { 
    var result = api_instance.reservationGetManagereservationsInfo(id, date);
    print(result);
} catch (e) {
    print("Exception when calling ReservationApi->reservationGetManagereservationsInfo: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **date** | **DateTime**|  | [default to null]

### Return type

[**PlacesReservationsReservationManageDto**](PlacesReservationsReservationManageDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationGetPersonReservations**
> List<PlacesReservationsReservationDto> reservationGetPersonReservations()



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ReservationApi();

try { 
    var result = api_instance.reservationGetPersonReservations();
    print(result);
} catch (e) {
    print("Exception when calling ReservationApi->reservationGetPersonReservations: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<PlacesReservationsReservationDto>**](PlacesReservationsReservationDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationGetReservationDetail**
> PlacesReservationsReservationDetailDto reservationGetReservationDetail(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ReservationApi();
var id = 56; // int | 

try { 
    var result = api_instance.reservationGetReservationDetail(id);
    print(result);
} catch (e) {
    print("Exception when calling ReservationApi->reservationGetReservationDetail: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]

### Return type

[**PlacesReservationsReservationDetailDto**](PlacesReservationsReservationDetailDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationGetReservationUsage**
> SmartHookahServicesPlaceReservationUsageDto reservationGetReservationUsage(id, date)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ReservationApi();
var id = 56; // int | 
var date = 2013-10-20T19:20:30+01:00; // DateTime | 

try { 
    var result = api_instance.reservationGetReservationUsage(id, date);
    print(result);
} catch (e) {
    print("Exception when calling ReservationApi->reservationGetReservationUsage: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **date** | **DateTime**|  | [default to null]

### Return type

[**SmartHookahServicesPlaceReservationUsageDto**](SmartHookahServicesPlaceReservationUsageDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationGetReservations**
> List<PlacesReservationsReservationDto> reservationGetReservations(from, to)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ReservationApi();
var from = 2013-10-20T19:20:30+01:00; // DateTime | 
var to = 2013-10-20T19:20:30+01:00; // DateTime | 

try { 
    var result = api_instance.reservationGetReservations(from, to);
    print(result);
} catch (e) {
    print("Exception when calling ReservationApi->reservationGetReservations: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **from** | **DateTime**|  | [default to null]
 **to** | **DateTime**|  | [default to null]

### Return type

[**List<PlacesReservationsReservationDto>**](PlacesReservationsReservationDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationRemoveTable**
> PlacesReservationsReservationDto reservationRemoveTable(id, body)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ReservationApi();
var id = 56; // int | 
var body = new int(); // int | 

try { 
    var result = api_instance.reservationRemoveTable(id, body);
    print(result);
} catch (e) {
    print("Exception when calling ReservationApi->reservationRemoveTable: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **body** | **int**|  | 

### Return type

[**PlacesReservationsReservationDto**](PlacesReservationsReservationDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationUpdateReservationState**
> bool reservationUpdateReservationState(id, body)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ReservationApi();
var id = 56; // int | 
var body = new String(); // String | 

try { 
    var result = api_instance.reservationUpdateReservationState(id, body);
    print(result);
} catch (e) {
    print("Exception when calling ReservationApi->reservationUpdateReservationState: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **body** | **String**|  | 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

