CREATE TABLE atlas_app.journey ();

ALTER TABLE atlas_app.journey ADD COLUMN convenience_cost integer NOT NULL;
ALTER TABLE atlas_app.journey ADD COLUMN distance_unit character varying(255) NOT NULL;
ALTER TABLE atlas_app.journey ADD COLUMN estimated_distance double precision NOT NULL;
ALTER TABLE atlas_app.journey ADD COLUMN estimated_duration integer ;
ALTER TABLE atlas_app.journey ADD COLUMN estimated_fare double precision ;
ALTER TABLE atlas_app.journey ADD COLUMN currency text ;
ALTER TABLE atlas_app.journey ADD COLUMN fare double precision ;
ALTER TABLE atlas_app.journey ADD COLUMN id character varying(36) NOT NULL;
ALTER TABLE atlas_app.journey ADD COLUMN legs_done integer NOT NULL;
ALTER TABLE atlas_app.journey ADD COLUMN modes text NOT NULL;
ALTER TABLE atlas_app.journey ADD COLUMN search_request_id character varying(36) NOT NULL;
ALTER TABLE atlas_app.journey ADD COLUMN total_legs integer NOT NULL;
ALTER TABLE atlas_app.journey ADD COLUMN merchant_id character varying(36) ;
ALTER TABLE atlas_app.journey ADD COLUMN merchant_operating_city_id character varying(36) ;
ALTER TABLE atlas_app.journey ADD COLUMN created_at timestamp with time zone NOT NULL default CURRENT_TIMESTAMP;
ALTER TABLE atlas_app.journey ADD COLUMN updated_at timestamp with time zone NOT NULL default CURRENT_TIMESTAMP;
ALTER TABLE atlas_app.journey ADD PRIMARY KEY ( id);