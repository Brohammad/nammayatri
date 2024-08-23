-- QUERIES FOR LOCAL ONLY
INSERT INTO atlas_app.beckn_config(
	bap_ifsc, buyer_finder_fee, collected_by, confirm_buffer_ttl_sec, confirm_ttl_sec, domain, gateway_url, id, init_ttl_sec, payment_params_json, registry_url, search_ttl_sec, select_ttl_sec, settlement_type, settlement_window, static_terms_url, subscriber_id, subscriber_url, vehicle_category, merchant_id, merchant_operating_city_id, created_at, updated_at, track_ttl_sec, status_ttl_sec, rating_ttl_sec, cancel_ttl_sec, unique_key_id)
	VALUES
	(null, null, 'BPP', 10, 120, 'MOBILITY', 'http://localhost:8015/v1', 'dd22a05d-29a3-42c8-9c8d-2de340f9b619', 120, '{"bankAccNumber": "xyz@upi","bankCode": "xyz"}', 'http://localhost:8020', 120, 120, null, null, null, 'localhost:8013/beckn/cab/v1/da4e23a5-3ce6-4c37-8b9b-41377c3c1a52', 'http://localhost:8013/beckn/cab/v1/da4e23a5-3ce6-4c37-8b9b-41377c3c1a52', 'AUTO_RICKSHAW', 'da4e23a5-3ce6-4c37-8b9b-41377c3c1a52', 'namma-yatri-0-0000-0000-00000000city', now(), now(), 30, 30, 120, 30, '000'),
	(null, null, 'BPP', 10, 120, 'MOBILITY', 'http://localhost:8015/v1', 'dd22a05d-29a3-42c8-9c8d-2de340f9b618', 120, '{"bankAccNumber": "xyz@upi","bankCode": "xyz"}', 'http://localhost:8020', 120, 120, null, null, null, 'localhost:8013/beckn/cab/v1/da4e23a5-3ce6-4c37-8b9b-41377c3c1a51', 'http://localhost:8013/beckn/cab/v1/da4e23a5-3ce6-4c37-8b9b-41377c3c1a51', 'AUTO_RICKSHAW', 'da4e23a5-3ce6-4c37-8b9b-41377c3c1a51', 'namma-yatri-0-0000-0000-00000000city', now(), now(), 30, 30, 120, 30, '001');

-- QUERIES FOR MASTER
INSERT INTO atlas_app.beckn_config
  ( bap_ifsc,
    buyer_finder_fee,
    collected_by,
    confirm_buffer_ttl_sec,
    confirm_ttl_sec,
    domain,
    gateway_url,
    id,
    init_ttl_sec,
    payment_params_json,
    registry_url,
    search_ttl_sec,
    select_ttl_sec,
    settlement_type,
    settlement_window,
    static_terms_url,
    subscriber_id,
    subscriber_url,
    vehicle_category,
    merchant_id,
    merchant_operating_city_id,
    created_at,
    updated_at,
    track_ttl_sec,
    status_ttl_sec,
    rating_ttl_sec,
    cancel_ttl_sec,
    unique_key_id
  )
  SELECT
    null,
    null,
    'BPP',
    10,
    120,
    'MOBILITY',
    'https://beta.beckn.uat.juspay.net/dev/gateway/v1',
    md5(random()::text || clock_timestamp()::text || city.id::text)::uuid,
    120,
    '{"bankAccNumber": "xyz@upi","bankCode": "xyz"}',
    'https://beta.beckn.uat.juspay.net/dev/registry',
    120,
    120,
    null,
    null,
    null,
    'api.sandbox.beckn.juspay.in/dev/bap/beckn/cab/v1/4b17bd06-ae7e-48e9-85bf-282fb310209c',
    'https://api.sandbox.beckn.juspay.in/dev/bap/beckn/cab/v1/4b17bd06-ae7e-48e9-85bf-282fb310209c',
    'AUTO_RICKSHAW',
    '4b17bd06-ae7e-48e9-85bf-282fb310209c',
    city.id,
    now(),
    now(),
    30,
    30,
    120,
    30,
    '50'
FROM atlas_app.merchant_operating_city city
WHERE city.merchant_id = '4b17bd06-ae7e-48e9-85bf-282fb310209c';


INSERT INTO atlas_app.beckn_config
  ( bap_ifsc,
    buyer_finder_fee,
    collected_by,
    confirm_buffer_ttl_sec,
    confirm_ttl_sec,
    domain,
    gateway_url,
    id,
    init_ttl_sec,
    payment_params_json,
    registry_url,
    search_ttl_sec,
    select_ttl_sec,
    settlement_type,
    settlement_window,
    static_terms_url,
    subscriber_id,
    subscriber_url,
    vehicle_category,
    merchant_id,
    merchant_operating_city_id,
    created_at,
    updated_at,
    track_ttl_sec,
    status_ttl_sec,
    rating_ttl_sec,
    cancel_ttl_sec,
    unique_key_id
  )
  SELECT
    null,
    null,
    'BPP',
    10,
    120,
    'MOBILITY',
    'https://beta.beckn.uat.juspay.net/dev/gateway/v1',
    md5(random()::text || clock_timestamp()::text || city.id::text)::uuid,
    120,
    '{"bankAccNumber": "xyz@upi","bankCode": "xyz"}',
    'https://beta.beckn.uat.juspay.net/dev/registry',
    120,
    120,
    null,
    null,
    null,
    'api.sandbox.beckn.juspay.in/dev/bap/beckn/cab/v1/da4e23a5-3ce6-4c37-8b9b-41377c3c1a51',
    'https://api.sandbox.beckn.juspay.in/dev/bap/beckn/cab/v1/da4e23a5-3ce6-4c37-8b9b-41377c3c1a51',
    'AUTO_RICKSHAW',
    'da4e23a5-3ce6-4c37-8b9b-41377c3c1a51',
    city.id,
    now(),
    now(),
    30,
    30,
    120,
    30,
    '54'
FROM atlas_app.merchant_operating_city city
WHERE city.merchant_id = 'da4e23a5-3ce6-4c37-8b9b-41377c3c1a51';

INSERT INTO atlas_app.beckn_config
  ( bap_ifsc,
    buyer_finder_fee,
    collected_by,
    confirm_buffer_ttl_sec,
    confirm_ttl_sec,
    domain,
    gateway_url,
    id,
    init_ttl_sec,
    payment_params_json,
    registry_url,
    search_ttl_sec,
    select_ttl_sec,
    settlement_type,
    settlement_window,
    static_terms_url,
    subscriber_id,
    subscriber_url,
    vehicle_category,
    merchant_id,
    merchant_operating_city_id,
    created_at,
    updated_at,
    track_ttl_sec,
    status_ttl_sec,
    rating_ttl_sec,
    cancel_ttl_sec,
    unique_key_id
  )
  SELECT
    null,
    null,
    'BPP',
    10,
    120,
    'MOBILITY',
    'https://beta.beckn.uat.juspay.net/dev/gateway/v1',
    md5(random()::text || clock_timestamp()::text || city.id::text)::uuid,
    120,
    '{"bankAccNumber": "xyz@upi","bankCode": "xyz"}',
    'https://beta.beckn.uat.juspay.net/dev/registry',
    120,
    120,
    null,
    null,
    null,
    'api.sandbox.beckn.juspay.in/dev/bap/beckn/cab/v1/e39cb491-03a3-4341-831b-b256ef3c95c9',
    'https://api.sandbox.beckn.juspay.in/dev/bap/beckn/cab/v1/e39cb491-03a3-4341-831b-b256ef3c95c9',
    'AUTO_RICKSHAW',
    'e39cb491-03a3-4341-831b-b256ef3c95c9',
    city.id,
    now(),
    now(),
    30,
    30,
    120,
    30,
    '65'
FROM atlas_app.merchant_operating_city city
WHERE city.merchant_id = 'e39cb491-03a3-4341-831b-b256ef3c95c9';

INSERT INTO atlas_app.beckn_config
  ( bap_ifsc,
    buyer_finder_fee,
    collected_by,
    confirm_buffer_ttl_sec,
    confirm_ttl_sec,
    domain,
    gateway_url,
    id,
    init_ttl_sec,
    payment_params_json,
    registry_url,
    search_ttl_sec,
    select_ttl_sec,
    settlement_type,
    settlement_window,
    static_terms_url,
    subscriber_id,
    subscriber_url,
    vehicle_category,
    merchant_id,
    merchant_operating_city_id,
    created_at,
    updated_at,
    track_ttl_sec,
    status_ttl_sec,
    rating_ttl_sec,
    cancel_ttl_sec,
    unique_key_id
  )
  SELECT
    null,
    null,
    'BPP',
    10,
    120,
    'MOBILITY',
    'https://beta.beckn.uat.juspay.net/dev/gateway/v1',
    md5(random()::text || clock_timestamp()::text || city.id::text)::uuid,
    120,
    '{"bankAccNumber": "xyz@upi","bankCode": "xyz"}',
    'https://beta.beckn.uat.juspay.net/dev/registry',
    120,
    120,
    null,
    null,
    null,
    'api.sandbox.beckn.juspay.in/dev/dobpp/beckn/96dd7f78-787e-4a0b-8675-e9e6fe93bb8f',
    'http://api.sandbox.beckn.juspay.in/dev/dobpp/beckn/96dd7f78-787e-4a0b-8675-e9e6fe93bb8f',
    'AUTO_RICKSHAW',
    'bd064716-ae7e-48e9-85bf-282fb310209c',
    city.id,
    now(),
    now(),
    30,
    30,
    120,
    30,
    '100'
FROM atlas_app.merchant_operating_city city
WHERE city.merchant_id = 'bd064716-ae7e-48e9-85bf-282fb310209c';

INSERT INTO atlas_app.beckn_config
  ( bap_ifsc,
    buyer_finder_fee,
    collected_by,
    confirm_buffer_ttl_sec,
    confirm_ttl_sec,
    domain,
    gateway_url,
    id,
    init_ttl_sec,
    payment_params_json,
    registry_url,
    search_ttl_sec,
    select_ttl_sec,
    settlement_type,
    settlement_window,
    static_terms_url,
    subscriber_id,
    subscriber_url,
    vehicle_category,
    merchant_id,
    merchant_operating_city_id,
    created_at,
    updated_at,
    track_ttl_sec,
    status_ttl_sec,
    rating_ttl_sec,
    cancel_ttl_sec,
    unique_key_id
  )
  SELECT
    null,
    null,
    'BPP',
    10,
    120,
    'MOBILITY',
    'https://beta.beckn.uat.juspay.net/dev/gateway/v1',
    md5(random()::text || clock_timestamp()::text || city.id::text)::uuid,
    120,
    '{"bankAccNumber": "xyz@upi","bankCode": "xyz"}',
    'https://beta.beckn.uat.juspay.net/dev/registry',
    120,
    120,
    null,
    null,
    null,
    'api.sandbox.beckn.juspay.in/dev/bap/beckn/cab/v1/bd064716-ae7e-48e9-85bf-282fb310209c',
    'https://api.sandbox.beckn.juspay.in/dev/bap/beckn/cab/v1/bd064716-ae7e-48e9-85bf-282fb310209c',
    'AUTO_RICKSHAW',
    'bd064716-ae7e-48e9-85bf-282fb310209c',
    city.id,
    now(),
    now(),
    30,
    30,
    120,
    30,
    '51'
FROM atlas_app.merchant_operating_city city
WHERE city.merchant_id = 'bd064716-ae7e-48e9-85bf-282fb310209c';

-- QUERIES FOR PROD
INSERT INTO atlas_app.beckn_config
  ( bap_ifsc,
    buyer_finder_fee,
    collected_by,
    confirm_buffer_ttl_sec,
    confirm_ttl_sec,
    domain,
    gateway_url,
    id,
    init_ttl_sec,
    payment_params_json,
    registry_url,
    search_ttl_sec,
    select_ttl_sec,
    settlement_type,
    settlement_window,
    static_terms_url,
    subscriber_id,
    subscriber_url,
    vehicle_category,
    merchant_id,
    merchant_operating_city_id,
    created_at,
    updated_at,
    track_ttl_sec,
    status_ttl_sec,
    rating_ttl_sec,
    cancel_ttl_sec,
    unique_key_id
  )
  SELECT
    null,
    null,
    'BPP',
    10,
    120,
    'MOBILITY',
    'https://prod.gateway.ondc.org/',
    md5(random()::text || clock_timestamp()::text || city.id::text)::uuid,
    120,
    '{"bankAccNumber": "xyz@upi","bankCode": "xyz"}',
    'https://prod.registry.ondc.org/',
    120,
    120,
    null,
    null,
    null,
    'api.beckn.juspay.in/bap/beckn/v1/c9811842-d572-11ed-afa1-0242ac120002',
    'https://api.beckn.juspay.in/bap/beckn/v1/c9811842-d572-11ed-afa1-0242ac120002',
    'AUTO_RICKSHAW',
    'c9811842-d572-11ed-afa1-0242ac120002',
    city.id,
    now(),
    now(),
    30,
    30,
    120,
    30,
    '61'
  FROM atlas_app.merchant_operating_city city
  WHERE city.merchant_id = 'c9811842-d572-11ed-afa1-0242ac120002';

INSERT INTO atlas_app.beckn_config
  ( bap_ifsc,
    buyer_finder_fee,
    collected_by,
    confirm_buffer_ttl_sec,
    confirm_ttl_sec,
    domain,
    gateway_url,
    id,
    init_ttl_sec,
    payment_params_json,
    registry_url,
    search_ttl_sec,
    select_ttl_sec,
    settlement_type,
    settlement_window,
    static_terms_url,
    subscriber_id,
    subscriber_url,
    vehicle_category,
    merchant_id,
    merchant_operating_city_id,
    created_at,
    updated_at,
    track_ttl_sec,
    status_ttl_sec,
    rating_ttl_sec,
    cancel_ttl_sec,
    unique_key_id
  )
  SELECT
    null,
    null,
    'BPP',
    10,
    120,
    'MOBILITY',
    'https://prod.gateway.ondc.org/',
    md5(random()::text || clock_timestamp()::text || city.id::text)::uuid,
    120,
    '{"bankAccNumber": "xyz@upi","bankCode": "xyz"}',
    'https://prod.registry.ondc.org/',
    120,
    120,
    null,
    null,
    null,
    'api.beckn.juspay.in/bap/beckn/v1/bd064716-ae7e-48e9-85bf-282fb310209c',
    'https://api.beckn.juspay.in/bap/beckn/v1/bd064716-ae7e-48e9-85bf-282fb310209c',
    'AUTO_RICKSHAW',
    'bd064716-ae7e-48e9-85bf-282fb310209c',
    city.id,
    now(),
    now(),
    30,
    30,
    120,
    30,
    '62'
  FROM atlas_app.merchant_operating_city city
  WHERE city.merchant_id = 'bd064716-ae7e-48e9-85bf-282fb310209c';

INSERT INTO atlas_app.beckn_config
  ( bap_ifsc,
    buyer_finder_fee,
    collected_by,
    confirm_buffer_ttl_sec,
    confirm_ttl_sec,
    domain,
    gateway_url,
    id,
    init_ttl_sec,
    payment_params_json,
    registry_url,
    search_ttl_sec,
    select_ttl_sec,
    settlement_type,
    settlement_window,
    static_terms_url,
    subscriber_id,
    subscriber_url,
    vehicle_category,
    merchant_id,
    merchant_operating_city_id,
    created_at,
    updated_at,
    track_ttl_sec,
    status_ttl_sec,
    rating_ttl_sec,
    cancel_ttl_sec,
    unique_key_id
  )
  SELECT
    null,
    null,
    'BPP',
    10,
    120,
    'MOBILITY',
    'https://prod.gateway.ondc.org/',
    md5(random()::text || clock_timestamp()::text || city.id::text)::uuid,
    120,
    '{"bankAccNumber": "xyz@upi","bankCode": "xyz"}',
    'https://prod.registry.ondc.org/',
    120,
    120,
    null,
    null,
    null,
    'api.beckn.juspay.in/bap/beckn/v1/4b17bd06-ae7e-48e9-85bf-282fb310209c',
    'https://api.beckn.juspay.in/bap/beckn/v1/4b17bd06-ae7e-48e9-85bf-282fb310209c',
    'AUTO_RICKSHAW',
    '4b17bd06-ae7e-48e9-85bf-282fb310209c',
    city.id,
    now(),
    now(),
    30,
    30,
    120,
    30,
    '60'
  FROM atlas_app.merchant_operating_city city
  WHERE city.merchant_id = '4b17bd06-ae7e-48e9-85bf-282fb310209c';

INSERT INTO atlas_app.beckn_config
  ( bap_ifsc,
    buyer_finder_fee,
    collected_by,
    confirm_buffer_ttl_sec,
    confirm_ttl_sec,
    domain,
    gateway_url,
    id,
    init_ttl_sec,
    payment_params_json,
    registry_url,
    search_ttl_sec,
    select_ttl_sec,
    settlement_type,
    settlement_window,
    static_terms_url,
    subscriber_id,
    subscriber_url,
    vehicle_category,
    merchant_id,
    merchant_operating_city_id,
    created_at,
    updated_at,
    track_ttl_sec,
    status_ttl_sec,
    rating_ttl_sec,
    cancel_ttl_sec,
    unique_key_id
  )
  SELECT
    null,
    null,
    'BPP',
    10,
    120,
    'MOBILITY',
    'https://api.beckn.juspay.in/gateway/v1',
    md5(random()::text || clock_timestamp()::text || city.id::text)::uuid,
    120,
    '{"bankAccNumber": "xyz@upi","bankCode": "xyz"}',
    'https://api.beckn.juspay.in/registry',
    120,
    120,
    null,
    null,
    null,
    'api.beckn.juspay.in/bap/beckn/v1/9e26fb47-ffc1-47a5-beb8-4b80142c9236',
    'https://api.beckn.juspay.in/bap/beckn/v1/9e26fb47-ffc1-47a5-beb8-4b80142c9236',
    'AUTO_RICKSHAW',
    '9e26fb47-ffc1-47a5-beb8-4b80142c9236',
    city.id,
    now(),
    now(),
    30,
    30,
    120,
    30,
    '64'
  FROM atlas_app.merchant_operating_city city
  WHERE city.merchant_id = '9e26fb47-ffc1-47a5-beb8-4b80142c9236';

INSERT INTO atlas_app.beckn_config
  ( bap_ifsc,
    buyer_finder_fee,
    collected_by,
    confirm_buffer_ttl_sec,
    confirm_ttl_sec,
    domain,
    gateway_url,
    id,
    init_ttl_sec,
    payment_params_json,
    registry_url,
    search_ttl_sec,
    select_ttl_sec,
    settlement_type,
    settlement_window,
    static_terms_url,
    subscriber_id,
    subscriber_url,
    vehicle_category,
    merchant_id,
    merchant_operating_city_id,
    created_at,
    updated_at,
    track_ttl_sec,
    status_ttl_sec,
    rating_ttl_sec,
    cancel_ttl_sec,
    unique_key_id
  )
  SELECT
    null,
    null,
    'BPP',
    10,
    120,
    'MOBILITY',
    'https://api.beckn.juspay.in/gateway/v1',
    md5(random()::text || clock_timestamp()::text || city.id::text)::uuid,
    120,
    '{"bankAccNumber": "xyz@upi","bankCode": "xyz"}',
    'https://api.beckn.juspay.in/registry',
    120,
    120,
    null,
    null,
    null,
    'api.beckn.juspay.in/bap/beckn/v1/11c05e23-f035-46fd-98a7-572dc8934323',
    'https://api.beckn.juspay.in/bap/beckn/v1/11c05e23-f035-46fd-98a7-572dc8934323',
    'AUTO_RICKSHAW',
    '11c05e23-f035-46fd-98a7-572dc8934323',
    city.id,
    now(),
    now(),
    30,
    30,
    120,
    30,
    '63'
  FROM atlas_app.merchant_operating_city city
  WHERE city.merchant_id = '11c05e23-f035-46fd-98a7-572dc8934323';