update atlas_driver_offer_bpp.vehicle_service_tier set vehicle_category = 'CAR' where service_tier_type IN ['COMFY', 'ECO', 'PREMIUM', 'SUV', 'HATCHBACK', 'SEDAN', 'TAXI', 'TAXI_PLUS', 'PREMIUM_SEDAN', 'BLACK', 'BLACK_XL', 'SUV_PLUS'];
update atlas_driver_offer_bpp.vehicle_service_tier set vehicle_category = 'MOTORCYCLE' where service_tier_type IN ['BIKE', 'DELIVERY_BIKE'];
update atlas_driver_offer_bpp.vehicle_service_tier set vehicle_category = 'TRUCK' where service_tier_type IN ['DELIVERY_LIGHT_GOODS_VEHICLE'];
update atlas_driver_offer_bpp.vehicle_service_tier set vehicle_category = 'AMBULANCE' where service_tier_type IN ['AMBULANCE_TAXI', 'AMBULANCE_TAXI_OXY', 'AMBULANCE_AC', 'AMBULANCE_AC_OXY', 'AMBULANCE_VENTILATOR'];
update atlas_driver_offer_bpp.vehicle_service_tier set vehicle_category = 'AUTO_CATEGORY' where service_tier_type IN ['AUTO_RICKSHAW'];
update atlas_driver_offer_bpp.vehicle_service_tier set base_vehicle_service_tier = false;
update atlas_driver_offer_bpp.vehicle_service_tier set base_vehicle_service_tier = true where service_tier_type IN ['TAXI', 'AUTO_RICKSHAW', 'BIKE', 'DELIVERY_BIKE', 'AMBULANCE_TAXI', 'DELIVERY_LIGHT_GOODS_VEHICLE'] and merchant_operating_city_id IN (SELECT id FROM atlas_driver_offer_bpp.merchant_operating_city WHERE city IN ['Bangalore', 'Kolkata']); ----only for blr and kolkata
update atlas_driver_offer_bpp.vehicle_service_tier set fare_addition_per_km_over_base_service_tier = 0 where base_vehicle_service_tier = true;
update atlas_driver_offer_bpp.vehicle_service_tier set fare_addition_per_km_over_base_service_tier = 2 where service_tier_type = 'ECO' and  merchant_operating_city_id IN (SELECT id FROM atlas_driver_offer_bpp.merchant_operating_city WHERE city = 'Bangalore'); ----only for blr;
update atlas_driver_offer_bpp.vehicle_service_tier set fare_addition_per_km_over_base_service_tier = 3 where service_tier_type = 'COMFY' and merchant_operating_city_id IN (SELECT id FROM atlas_driver_offer_bpp.merchant_operating_city WHERE city = 'Bangalore'); ----only for blr;
update atlas_driver_offer_bpp.vehicle_service_tier set fare_addition_per_km_over_base_service_tier = 5 where service_tier_type = 'SUV' and merchant_operating_city_id IN (SELECT id FROM atlas_driver_offer_bpp.merchant_operating_city WHERE city = 'Bangalore'); ----only for blr;

update atlas_driver_offer_bpp.vehicle_service_tier set fare_addition_per_km_over_base_service_tier = 2 where service_tier_type = 'HATCHBACK' and merchant_operating_city_id IN (SELECT id FROM atlas_driver_offer_bpp.merchant_operating_city WHERE city = 'Kolkata'); ----only for kolkata;
update atlas_driver_offer_bpp.vehicle_service_tier set fare_addition_per_km_over_base_service_tier = 3 where service_tier_type = 'SEDAN' and merchant_operating_city_id IN (SELECT id FROM atlas_driver_offer_bpp.merchant_operating_city WHERE city = 'Kolkata'); ----only for kolkata;
update atlas_driver_offer_bpp.vehicle_service_tier set fare_addition_per_km_over_base_service_tier = 5 where service_tier_type = 'SUV' and merchant_operating_city_id IN (SELECT id FROM atlas_driver_offer_bpp.merchant_operating_city WHERE city = 'Kolkata'); ----only for kolkata;





