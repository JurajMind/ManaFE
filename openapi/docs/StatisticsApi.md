# openapi.api.StatisticsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost:44324*

Method | HTTP request | Description
------------- | ------------- | -------------
[**statisticsGetStatistics**](StatisticsApi.md#statisticsGetStatistics) | **GET** /api/Statistics/GetStatistics | 


# **statisticsGetStatistics**
> PersonStatisticsOverallDto statisticsGetStatistics(from, to)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new StatisticsApi();
var from = 2013-10-20T19:20:30+01:00; // DateTime | 
var to = 2013-10-20T19:20:30+01:00; // DateTime | 

try { 
    var result = api_instance.statisticsGetStatistics(from, to);
    print(result);
} catch (e) {
    print("Exception when calling StatisticsApi->statisticsGetStatistics: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **from** | **DateTime**|  | [default to null]
 **to** | **DateTime**|  | [default to null]

### Return type

[**PersonStatisticsOverallDto**](PersonStatisticsOverallDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

