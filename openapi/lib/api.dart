library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';

part 'api/account_api.dart';
part 'api/anim_api.dart';
part 'api/animation_api.dart';
part 'api/device_api.dart';
part 'api/device_preset_api.dart';
part 'api/end_session_api.dart';
part 'api/gear_api.dart';
part 'api/mixology_api.dart';
part 'api/person_api.dart';
part 'api/ping_api.dart';
part 'api/place_calendar_api.dart';
part 'api/places_api.dart';
part 'api/puf_api.dart';
part 'api/qr_code_api.dart';
part 'api/reservation_api.dart';
part 'api/sent_to_device_api.dart';
part 'api/smoke_session_api.dart';
part 'api/stand_picture_api.dart';
part 'api/statistics_api.dart';
part 'api/tobacco_api.dart';

part 'model/action_settings.dart';
part 'model/address_dto.dart';
part 'model/animations.dart';
part 'model/brand_group_dto.dart';
part 'model/business_hours_dto.dart';
part 'model/device_preset_dto.dart';
part 'model/device_setting_dto.dart';
part 'model/device_simple_dto.dart';
part 'model/dto.dart';
part 'model/dynamic_smoke_statistic_raw_dto.dart';
part 'model/franchise_dto.dart';
part 'model/game_picture_dto.dart';
part 'model/game_profile_simple_dto.dart';
part 'model/hookah_order_dto.dart';
part 'model/init_data_dto.dart';
part 'model/inline_response200.dart';
part 'model/media_dto.dart';
part 'model/mix_creator.dart';
part 'model/mix_creators_dto.dart';
part 'model/nearby_places_dto.dart';
part 'model/person_active_data_dto.dart';
part 'model/person_info_dto.dart';
part 'model/person_statistics_overall_dto.dart';
part 'model/pipe_accesory_like_dto.dart';
part 'model/pipe_accesory_simple_dto.dart';
part 'model/pipe_accessory_details_dto.dart';
part 'model/pipe_accessory_statistics_dto.dart';
part 'model/pipe_accessory_usage_dto.dart';
part 'model/place_calendar_dto.dart';
part 'model/place_day.dart';
part 'model/place_dto.dart';
part 'model/place_event.dart';
part 'model/place_event_collection.dart';
part 'model/place_menu_dto.dart';
part 'model/place_simple_dto.dart';
part 'model/places_device_place_dashboard_dto.dart';
part 'model/places_place_dashboard_dto.dart';
part 'model/price_group_items.dart';
part 'model/reservation_detail_dto.dart';
part 'model/reservation_dto.dart';
part 'model/reservation_manage_dto.dart';
part 'model/reservations_time_slot.dart';
part 'model/search_pipe_accessory.dart';
part 'model/seat_dto.dart';
part 'model/smart_hookah_controllers_price_group_dto.dart';
part 'model/smart_hookah_helpers_animation.dart';
part 'model/smart_hookah_models_db_color.dart';
part 'model/smart_hookah_models_db_puf.dart';
part 'model/smart_hookah_models_forgot_password_view_model.dart';
part 'model/smart_hookah_models_order_extra_dto.dart';
part 'model/smart_hookah_models_parameter_objects_change_animation.dart';
part 'model/smart_hookah_models_parameter_objects_change_brightness.dart';
part 'model/smart_hookah_models_parameter_objects_change_color.dart';
part 'model/smart_hookah_models_parameter_objects_change_speed.dart';
part 'model/smart_hookah_services_gear_tobacco_filter.dart';
part 'model/smart_hookah_services_place_reservation_usage_dto.dart';
part 'model/smoke_session_meta_data_dto.dart';
part 'model/smoke_session_simple_dto.dart';
part 'model/smoke_session_time_statistics_dto.dart';
part 'model/tobacco_dto.dart';
part 'model/tobacco_in_mix.dart';
part 'model/tobacco_information_dto.dart';
part 'model/tobacco_mix_simple_dto.dart';
part 'model/tobacco_review_dto.dart';
part 'model/tobacco_simple_dto.dart';
part 'model/tobacco_taste_dto.dart';
part 'model/used_with_dto.dart';
part 'model/user_model.dart';
part 'model/validation.dart';


ApiClient defaultApiClient = ApiClient();
