CREATE TABLE atlas_app.app_dynamic_logic_element ();

ALTER TABLE atlas_app.app_dynamic_logic_element ADD COLUMN domain text NOT NULL;
ALTER TABLE atlas_app.app_dynamic_logic_element ADD COLUMN logic text NOT NULL;
ALTER TABLE atlas_app.app_dynamic_logic_element ADD COLUMN "order" integer NOT NULL;
ALTER TABLE atlas_app.app_dynamic_logic_element ADD COLUMN version integer NOT NULL;
ALTER TABLE atlas_app.app_dynamic_logic_element ADD COLUMN created_at timestamp with time zone NOT NULL default CURRENT_TIMESTAMP;
ALTER TABLE atlas_app.app_dynamic_logic_element ADD COLUMN updated_at timestamp with time zone NOT NULL default CURRENT_TIMESTAMP;
ALTER TABLE atlas_app.app_dynamic_logic_element ADD PRIMARY KEY ( domain, order, version);