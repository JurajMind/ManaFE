import 'package:openapi/src/model/action_settings.dart';
import 'package:openapi/src/model/address_dto.dart';
import 'package:openapi/src/model/animations.dart';
import 'package:openapi/src/model/brand_dto.dart';
import 'package:openapi/src/model/brand_group_dto.dart';
import 'package:openapi/src/model/business_hours_dto.dart';
import 'package:openapi/src/model/device_device_picture_dto.dart';
import 'package:openapi/src/model/device_preset_dto.dart';
import 'package:openapi/src/model/device_setting_dto.dart';
import 'package:openapi/src/model/device_simple_dto.dart';
import 'package:openapi/src/model/device_update_dto.dart';
import 'package:openapi/src/model/device_update_info_dto.dart';
import 'package:openapi/src/model/dto.dart';
import 'package:openapi/src/model/dynamic_smoke_statistic_raw_dto.dart';
import 'package:openapi/src/model/feature_mix_creator_dto.dart';
import 'package:openapi/src/model/feature_mix_creator_simple_dto.dart';
import 'package:openapi/src/model/finished_session_data_dto.dart';
import 'package:openapi/src/model/franchise_dto.dart';
import 'package:openapi/src/model/game_picture_dto.dart';
import 'package:openapi/src/model/game_profile_simple_dto.dart';
import 'package:openapi/src/model/gear_get_brands200_response.dart';
import 'package:openapi/src/model/gear_tobacco_review_detail_dto.dart';
import 'package:openapi/src/model/gear_tobacco_review_dto.dart';
import 'package:openapi/src/model/hookah_order_dto.dart';
import 'package:openapi/src/model/init_data_dto.dart';
import 'package:openapi/src/model/media_dto.dart';
import 'package:openapi/src/model/nearby_places_dto.dart';
import 'package:openapi/src/model/person_active_data_dto.dart';
import 'package:openapi/src/model/person_info_dto.dart';
import 'package:openapi/src/model/person_statistics_overall_dto.dart';
import 'package:openapi/src/model/pipe_accesory_like_dto.dart';
import 'package:openapi/src/model/pipe_accesory_simple_dto.dart';
import 'package:openapi/src/model/pipe_accessory_details_dto.dart';
import 'package:openapi/src/model/pipe_accessory_statistics_dto.dart';
import 'package:openapi/src/model/pipe_accessory_usage_dto.dart';
import 'package:openapi/src/model/place_calendar_dto.dart';
import 'package:openapi/src/model/place_day.dart';
import 'package:openapi/src/model/place_dto.dart';
import 'package:openapi/src/model/place_event.dart';
import 'package:openapi/src/model/place_event_collection.dart';
import 'package:openapi/src/model/place_menu_dto.dart';
import 'package:openapi/src/model/place_simple_dto.dart';
import 'package:openapi/src/model/places_device_place_dashboard_dto.dart';
import 'package:openapi/src/model/places_place_dashboard_dto.dart';
import 'package:openapi/src/model/places_place_review_dto.dart';
import 'package:openapi/src/model/places_reservations_reservation_detail_dto.dart';
import 'package:openapi/src/model/places_reservations_reservation_dto.dart';
import 'package:openapi/src/model/places_reservations_reservation_manage_dto.dart';
import 'package:openapi/src/model/price_group_items.dart';
import 'package:openapi/src/model/reservations_time_slot.dart';
import 'package:openapi/src/model/search_pipe_accessory.dart';
import 'package:openapi/src/model/seat_dto.dart';
import 'package:openapi/src/model/smart_hookah_controllers_api_device_info_response.dart';
import 'package:openapi/src/model/smart_hookah_controllers_price_group_dto.dart';
import 'package:openapi/src/model/smart_hookah_helpers_animation.dart';
import 'package:openapi/src/model/smart_hookah_models_db_color.dart';
import 'package:openapi/src/model/smart_hookah_models_db_puf.dart';
import 'package:openapi/src/model/smart_hookah_models_db_session_dto_session_place_review_dto.dart';
import 'package:openapi/src/model/smart_hookah_models_db_session_dto_session_review_dto.dart';
import 'package:openapi/src/model/smart_hookah_models_db_social_media.dart';
import 'package:openapi/src/model/smart_hookah_models_forgot_password_view_model.dart';
import 'package:openapi/src/model/smart_hookah_models_order_extra_dto.dart';
import 'package:openapi/src/model/smart_hookah_models_parameter_objects_change_animation.dart';
import 'package:openapi/src/model/smart_hookah_models_parameter_objects_change_brightness.dart';
import 'package:openapi/src/model/smart_hookah_models_parameter_objects_change_color.dart';
import 'package:openapi/src/model/smart_hookah_models_parameter_objects_change_speed.dart';
import 'package:openapi/src/model/smart_hookah_models_redis_competition_entry.dart';
import 'package:openapi/src/model/smart_hookah_services_gear_tobacco_filter.dart';
import 'package:openapi/src/model/smart_hookah_services_place_reservation_usage_dto.dart';
import 'package:openapi/src/model/smoke_session_meta_data_dto.dart';
import 'package:openapi/src/model/smoke_session_simple_dto.dart';
import 'package:openapi/src/model/smoke_session_statistics_dto.dart';
import 'package:openapi/src/model/smoke_session_time_statistics_dto.dart';
import 'package:openapi/src/model/tobacco_dto.dart';
import 'package:openapi/src/model/tobacco_in_mix.dart';
import 'package:openapi/src/model/tobacco_information_dto.dart';
import 'package:openapi/src/model/tobacco_mix_simple_dto.dart';
import 'package:openapi/src/model/tobacco_simple_dto.dart';
import 'package:openapi/src/model/tobacco_taste_dto.dart';
import 'package:openapi/src/model/used_with_dto.dart';
import 'package:openapi/src/model/user_model.dart';
import 'package:openapi/src/model/validation.dart';

final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

  ReturnType deserialize<ReturnType, BaseType>(dynamic value, String targetType, {bool growable= true}) {
      switch (targetType) {
        case 'String':
          return '$value' as ReturnType;
        case 'int':
          return (value is int ? value : int.parse('$value')) as ReturnType;
        case 'bool':
          if (value is bool) {
            return value as ReturnType;
          }
          final valueString = '$value'.toLowerCase();
          return (valueString == 'true' || valueString == '1') as ReturnType;
        case 'double':
          return (value is double ? value : double.parse('$value')) as ReturnType;
        case 'ActionSettings':
          return ActionSettings.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AddressDto':
          return AddressDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Animations':
          return Animations.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BrandDto':
          return BrandDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BrandGroupDto':
          return BrandGroupDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BusinessHoursDto':
          return BusinessHoursDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DeviceDevicePictureDto':
          return DeviceDevicePictureDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DevicePresetDto':
          return DevicePresetDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DeviceSettingDto':
          return DeviceSettingDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DeviceSimpleDto':
          return DeviceSimpleDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DeviceUpdateDto':
          return DeviceUpdateDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DeviceUpdateInfoDto':
          return DeviceUpdateInfoDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Dto':
          return Dto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DynamicSmokeStatisticRawDto':
          return DynamicSmokeStatisticRawDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FeatureMixCreatorDto':
          return FeatureMixCreatorDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FeatureMixCreatorSimpleDto':
          return FeatureMixCreatorSimpleDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FinishedSessionDataDto':
          return FinishedSessionDataDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FranchiseDto':
          return FranchiseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GamePictureDto':
          return GamePictureDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GameProfileSimpleDto':
          return GameProfileSimpleDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GearGetBrands200Response':
          return GearGetBrands200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GearTobaccoReviewDetailDto':
          return GearTobaccoReviewDetailDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GearTobaccoReviewDto':
          return GearTobaccoReviewDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'HookahOrderDto':
          return HookahOrderDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'InitDataDto':
          return InitDataDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MediaDto':
          return MediaDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'NearbyPlacesDto':
          return NearbyPlacesDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PersonActiveDataDto':
          return PersonActiveDataDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PersonInfoDto':
          return PersonInfoDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PersonStatisticsOverallDto':
          return PersonStatisticsOverallDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PipeAccesoryLikeDto':
          return PipeAccesoryLikeDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PipeAccesorySimpleDto':
          return PipeAccesorySimpleDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PipeAccessoryDetailsDto':
          return PipeAccessoryDetailsDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PipeAccessoryStatisticsDto':
          return PipeAccessoryStatisticsDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PipeAccessoryUsageDto':
          return PipeAccessoryUsageDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PlaceCalendarDto':
          return PlaceCalendarDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PlaceDay':
          return PlaceDay.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PlaceDto':
          return PlaceDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PlaceEvent':
          return PlaceEvent.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PlaceEventCollection':
          return PlaceEventCollection.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PlaceMenuDto':
          return PlaceMenuDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PlaceSimpleDto':
          return PlaceSimpleDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PlacesDevicePlaceDashboardDto':
          return PlacesDevicePlaceDashboardDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PlacesPlaceDashboardDto':
          return PlacesPlaceDashboardDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PlacesPlaceReviewDto':
          return PlacesPlaceReviewDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PlacesReservationsReservationDetailDto':
          return PlacesReservationsReservationDetailDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PlacesReservationsReservationDto':
          return PlacesReservationsReservationDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PlacesReservationsReservationManageDto':
          return PlacesReservationsReservationManageDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PriceGroupItems':
          return PriceGroupItems.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ReservationsTimeSlot':
          return ReservationsTimeSlot.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SearchPipeAccessory':
          return SearchPipeAccessory.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SeatDto':
          return SeatDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SmartHookahControllersApiDeviceInfoResponse':
          return SmartHookahControllersApiDeviceInfoResponse.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SmartHookahControllersPriceGroupDto':
          return SmartHookahControllersPriceGroupDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SmartHookahHelpersAnimation':
          return SmartHookahHelpersAnimation.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SmartHookahModelsDbColor':
          return SmartHookahModelsDbColor.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SmartHookahModelsDbPuf':
          return SmartHookahModelsDbPuf.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SmartHookahModelsDbSessionDtoSessionPlaceReviewDto':
          return SmartHookahModelsDbSessionDtoSessionPlaceReviewDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SmartHookahModelsDbSessionDtoSessionReviewDto':
          return SmartHookahModelsDbSessionDtoSessionReviewDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SmartHookahModelsDbSocialMedia':
          return SmartHookahModelsDbSocialMedia.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SmartHookahModelsForgotPasswordViewModel':
          return SmartHookahModelsForgotPasswordViewModel.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SmartHookahModelsOrderExtraDto':
          return SmartHookahModelsOrderExtraDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SmartHookahModelsParameterObjectsChangeAnimation':
          return SmartHookahModelsParameterObjectsChangeAnimation.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SmartHookahModelsParameterObjectsChangeBrightness':
          return SmartHookahModelsParameterObjectsChangeBrightness.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SmartHookahModelsParameterObjectsChangeColor':
          return SmartHookahModelsParameterObjectsChangeColor.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SmartHookahModelsParameterObjectsChangeSpeed':
          return SmartHookahModelsParameterObjectsChangeSpeed.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SmartHookahModelsRedisCompetitionEntry':
          return SmartHookahModelsRedisCompetitionEntry.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SmartHookahServicesGearTobaccoFilter':
          return SmartHookahServicesGearTobaccoFilter.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SmartHookahServicesPlaceReservationUsageDto':
          return SmartHookahServicesPlaceReservationUsageDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SmokeSessionMetaDataDto':
          return SmokeSessionMetaDataDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SmokeSessionSimpleDto':
          return SmokeSessionSimpleDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SmokeSessionStatisticsDto':
          return SmokeSessionStatisticsDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SmokeSessionTimeStatisticsDto':
          return SmokeSessionTimeStatisticsDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TobaccoDto':
          return TobaccoDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TobaccoInMix':
          return TobaccoInMix.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TobaccoInformationDto':
          return TobaccoInformationDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TobaccoMixSimpleDto':
          return TobaccoMixSimpleDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TobaccoSimpleDto':
          return TobaccoSimpleDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TobaccoTasteDto':
          return TobaccoTasteDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'UsedWithDto':
          return UsedWithDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'UserModel':
          return UserModel.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Validation':
          return Validation.fromJson(value as Map<String, dynamic>) as ReturnType;
        default:
          RegExpMatch? match;

          if (value is List && (match = _regList.firstMatch(targetType)) != null) {
            targetType = match![1]!; // ignore: parameter_assignments
            return value
              .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable))
              .toList(growable: growable) as ReturnType;
          }
          if (value is Set && (match = _regSet.firstMatch(targetType)) != null) {
            targetType = match![1]!; // ignore: parameter_assignments
            return value
              .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable))
              .toSet() as ReturnType;
          }
          if (value is Map && (match = _regMap.firstMatch(targetType)) != null) {
            targetType = match![1]!; // ignore: parameter_assignments
            return Map<dynamic, BaseType>.fromIterables(
              value.keys,
              value.values.map((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable)),
            ) as ReturnType;
          }
          break;
    } 
    throw Exception('Cannot deserialize');
  }