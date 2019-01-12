# openapi.api.ReservationApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**reservationCreate**](ReservationApi.md#reservationCreate) | **POST** /api/Reservations/Create | 
[**reservationGetManagereservationsInfo**](ReservationApi.md#reservationGetManagereservationsInfo) | **GET** /api/Reservations/{id}/Manage | 


# **reservationCreate**
> bool reservationCreate(reservationDto)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ReservationApi();
var reservationDto = new ReservationDto(); // ReservationDto | 

try { 
    var result = api_instance.reservationCreate(reservationDto);
    print(result);
} catch (e) {
    print("Exception when calling ReservationApi->reservationCreate: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reservationDto** | [**ReservationDto**](ReservationDto.md)|  | 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationGetManagereservationsInfo**
> ReservationManageDto reservationGetManagereservationsInfo(id, date)



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

[**ReservationManageDto**](ReservationManageDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

