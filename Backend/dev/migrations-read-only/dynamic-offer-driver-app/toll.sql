CREATE TABLE atlas_driver_offer_bpp.toll ();

ALTER TABLE atlas_driver_offer_bpp.toll ADD COLUMN created_at timestamp with time zone NOT NULL default CURRENT_TIMESTAMP;
ALTER TABLE atlas_driver_offer_bpp.toll ADD COLUMN id character varying(36) NOT NULL;
ALTER TABLE atlas_driver_offer_bpp.toll ADD COLUMN name text NOT NULL;
ALTER TABLE atlas_driver_offer_bpp.toll ADD COLUMN currency text ;
ALTER TABLE atlas_driver_offer_bpp.toll ADD COLUMN price double precision NOT NULL;
ALTER TABLE atlas_driver_offer_bpp.toll ADD COLUMN toll_end_gates text[] NOT NULL;
ALTER TABLE atlas_driver_offer_bpp.toll ADD COLUMN toll_start_gates text[] NOT NULL;
ALTER TABLE atlas_driver_offer_bpp.toll ADD COLUMN updated_at timestamp with time zone NOT NULL default CURRENT_TIMESTAMP;
ALTER TABLE atlas_driver_offer_bpp.toll ADD COLUMN merchant_id character varying(36) ;
ALTER TABLE atlas_driver_offer_bpp.toll ADD COLUMN merchant_operating_city_id character varying(36) ;
ALTER TABLE atlas_driver_offer_bpp.toll ADD PRIMARY KEY ( id);