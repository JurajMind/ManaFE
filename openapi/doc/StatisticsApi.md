# openapi.api.StatisticsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**statisticsGetStatistics**](StatisticsApi.md#statisticsgetstatistics) | **GET** /api/Statistics/GetStatistics | 


# **statisticsGetStatistics**
> PersonStatisticsOverallDto statisticsGetStatistics(from, to)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getStatisticsApi();
final DateTime from = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime to = 2013-10-20T19:20:30+01:00; // DateTime | 

try {
    final response = api.statisticsGetStatistics(from, to);
    print(response);
} catch on DioError (e) {
    print('Exception when calling StatisticsApi->statisticsGetStatistics: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **from** | **DateTime**|  | 
 **to** | **DateTime**|  | 

### Return type

[**PersonStatisticsOverallDto**](PersonStatisticsOverallDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

