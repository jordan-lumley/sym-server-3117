------------------------------------------------------------------------------
-- Sample Data
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Clear and load SymmetricDS Configuration
------------------------------------------------------------------------------

delete from sym_trigger_router;
delete from sym_trigger;
delete from sym_router;
--delete from sym_channel where channel_id in ('a1pos_log','android_log','employee','employee_call_log','employee_location','inventory','inventory_variance','item','merchant','merchant_item','pick_ticket','purchase_order','vendor');
delete from sym_channel where channel_id in ('a1pos_log', 'android_log','employee_call_log','employee_location');
delete from sym_node_group_link;
delete from sym_node_group;
delete from sym_node_host;
delete from sym_node_identity;
delete from sym_node_security;
delete from sym_node;

------------------------------------------------------------------------------
-- Channels
------------------------------------------------------------------------------

insert into sym_channel 
(channel_id, processing_order, max_batch_size, enabled, description)
values('a1pos_log', 1, 500000, 1, 'sale_transactional data from register and back office');

insert into sym_channel 
(channel_id, processing_order, max_batch_size, enabled, description)
values('android_log', 1, 500000, 1, 'sale_transactional data from register and back office');

--insert into sym_channel 
--(channel_id, processing_order, max_batch_size, enabled, description)
--values('employee', 1, 500000, 1, 'sale_transactional data from register and back office');

insert into sym_channel 
(channel_id, processing_order, max_batch_size, enabled, description)
values('employee_location', 1, 500000, 1, 'sale_transactional data from register and back office');

insert into sym_channel 
(channel_id, processing_order, max_batch_size, enabled, description)
values('employee_call_log', 1, 500000, 1, 'sale_transactional data from register and back office');

--insert into sym_channel 
--(channel_id, processing_order, max_batch_size, enabled, description)
--values('inventory', 1, 100000, 1, 'sale_transactional data from register and back office');

--insert into sym_channel 
--(channel_id, processing_order, max_batch_size, enabled, description)
--values('inventory_variance', 1, 500000, 1, 'sale_transactional data from register and back office');

--insert into sym_channel 
--(channel_id, processing_order, max_batch_size, enabled, description)
--values('item', 1, 500000, 1, 'sale_transactional data from register and back office');

--insert into sym_channel 
--(channel_id, processing_order, max_batch_size, enabled, description)
--values('merchant', 1, 500000, 1, 'sale_transactional data from register and back office');

--insert into sym_channel 
--(channel_id, processing_order, max_batch_size, enabled, description)
--values('merchant_item', 1, 500000, 1, 'sale_transactional data from register and back office');

--insert into sym_channel 
--(channel_id, processing_order, max_batch_size, enabled, description)
--values('pick_ticket', 1, 500000, 1, 'sale_transactional data from register and back office');

--insert into sym_channel 
--(channel_id, processing_order, max_batch_size, enabled, description)
--values('purchase_order', 1, 500000, 1, 'sale_transactional data from register and back office');

--insert into sym_channel 
--(channel_id, processing_order, max_batch_size, enabled, description)
--values('vendor', 1, 500000, 1, 'sale_transactional data from register and back office');

------------------------------------------------------------------------------
-- Node Groups
------------------------------------------------------------------------------

insert into sym_node_group (node_group_id) values ('android-client');

insert into sym_node_group (node_group_id) values ('corp');

insert into sym_node_group (node_group_id) values ('client');

insert into sym_node_group (node_group_id) values ('a1pos-client');

------------------------------------------------------------------------------
-- Node Group Links
------------------------------------------------------------------------------

insert into sym_node_group_link (source_node_group_id, target_node_group_id, data_event_action) values ('corp', 'android-client', 'W');

insert into sym_node_group_link (source_node_group_id, target_node_group_id, data_event_action) values ('android-client', 'corp', 'P');

insert into sym_node_group_link (source_node_group_id, target_node_group_id, data_event_action) values ('corp', 'client', 'W');

insert into sym_node_group_link (source_node_group_id, target_node_group_id, data_event_action) values ('client', 'corp', 'P');

insert into sym_node_group_link (source_node_group_id, target_node_group_id, data_event_action) values ('corp', 'a1pos-client', 'W');

insert into sym_node_group_link (source_node_group_id, target_node_group_id, data_event_action) values ('a1pos-client', 'corp', 'P');

------------------------------------------------------------------------------
-- Triggers
------------------------------------------------------------------------------

insert into sym_trigger
(trigger_id,source_table_name,channel_id,sync_on_incoming_batch,sync_on_update, sync_on_insert, sync_on_delete, last_update_time,create_time)
values('a1pos_log','a1pos_log','a1pos_log',1,1,1,1,current_timestamp,current_timestamp);

insert into sym_trigger 
(trigger_id,source_table_name,channel_id,sync_on_incoming_batch,sync_on_update, sync_on_insert, sync_on_delete, last_update_time,create_time)
values('android_log','android_log','android_log',1,1,1,1,current_timestamp,current_timestamp);

insert into sym_trigger 
(trigger_id,source_table_name,channel_id,sync_on_incoming_batch,sync_on_update, sync_on_insert, sync_on_delete, last_update_time,create_time)
values('employee','employee','employee',1,1,1,1,current_timestamp,current_timestamp);

insert into sym_trigger 
(trigger_id,source_table_name,channel_id,sync_on_incoming_batch,sync_on_update, sync_on_insert, sync_on_delete, last_update_time,create_time)
values('employee_location','employee_location','employee_location',1,1,1,1,current_timestamp,current_timestamp);

insert into sym_trigger 
(trigger_id,source_table_name,channel_id,sync_on_incoming_batch,sync_on_update, sync_on_insert, sync_on_delete, last_update_time,create_time)
values('employee_call_log','employee_call_log','employee_call_log',1,1,1,1,current_timestamp,current_timestamp);

--insert into sym_trigger 
--(trigger_id,source_table_name,channel_id,sync_on_incoming_batch,sync_on_update, sync_on_insert, sync_on_delete, last_update_time,create_time)
--values('inventory','inventory','inventory',1,1,1,1,current_timestamp,current_timestamp);

--insert into sym_trigger 
--(trigger_id,source_table_name,channel_id,sync_on_incoming_batch,sync_on_update, sync_on_insert, sync_on_delete, last_update_time,create_time)
--values('inventory_variance','inventory_variance','inventory_variance',1,1,1,1,current_timestamp,current_timestamp);

--insert into sym_trigger 
--(trigger_id,source_table_name,channel_id,sync_on_incoming_batch,sync_on_update, sync_on_insert, sync_on_delete, last_update_time,create_time)
--values('item','item','item',1,1,1,1,current_timestamp,current_timestamp);

--insert into sym_trigger 
--(trigger_id,source_table_name,channel_id,sync_on_incoming_batch,sync_on_update, sync_on_insert, sync_on_delete, last_update_time,create_time)
--values('merchant','merchant','merchant',1,1,1,1,current_timestamp,current_timestamp);

--insert into sym_trigger 
--(trigger_id,source_table_name,channel_id,sync_on_incoming_batch,sync_on_update, sync_on_insert, sync_on_delete, last_update_time,create_time)
--values('merchant_item','merchant_item','merchant_item',1,1,1,1,current_timestamp,current_timestamp);

--insert into sym_trigger 
--(trigger_id,source_table_name,channel_id,sync_on_incoming_batch,sync_on_update, sync_on_insert, sync_on_delete, last_update_time,create_time)
--values('pick_ticket','pick_ticket','pick_ticket',1,1,1,1,current_timestamp,current_timestamp);

--insert into sym_trigger 
--(trigger_id,source_table_name,channel_id,sync_on_incoming_batch,sync_on_update, sync_on_insert, sync_on_delete, last_update_time,create_time)
--values('purchase_order','purchase_order','purchase_order',1,1,1,1,current_timestamp,current_timestamp);

--insert into sym_trigger 
--(trigger_id,source_table_name,channel_id,sync_on_incoming_batch,sync_on_update, sync_on_insert, sync_on_delete, last_update_time,create_time)
--values('vendor','vendor','vendor',1,1,1,1,current_timestamp,current_timestamp);


------------------------------------------------------------------------------
-- Routers
------------------------------------------------------------------------------

-- Default router sends all data from store to corp

insert into sym_router
(router_id,source_node_group_id,target_node_group_id, router_type,create_time,last_update_time)
values('corp_2_a1pos_client', 'corp','a1pos-client', 'default',current_timestamp, current_timestamp);

insert into sym_router
(router_id,source_node_group_id,target_node_group_id, router_type,create_time,last_update_time)
values('a1pos_client_2_corp', 'a1pos-client','corp', 'default',current_timestamp, current_timestamp);

insert into sym_router
(router_id,source_node_group_id,target_node_group_id, router_type,create_time,last_update_time)
values('corp_2_android_client', 'corp','android-client', 'default',current_timestamp, current_timestamp);

insert into sym_router
(router_id,source_node_group_id,target_node_group_id, router_type,create_time,last_update_time)
values('android_client_2_corp', 'android-client','corp', 'default',current_timestamp, current_timestamp);

insert into sym_router
(router_id,source_node_group_id,target_node_group_id, router_type,create_time,last_update_time)
values('corp_2_client', 'corp','client', 'default',current_timestamp, current_timestamp);

insert into sym_router
(router_id,source_node_group_id,target_node_group_id, router_type,create_time,last_update_time)
values('client_2_corp', 'client','corp', 'default',current_timestamp, current_timestamp);

insert into sym_router 
(router_id,source_node_group_id,target_node_group_id,router_type,router_expression,create_time,last_update_time)
values('corp_2_one_android_client', 'corp', 'android-client', 'column','device=:EXTERNAL_ID',current_timestamp, current_timestamp);

------------------------------------------------------------------------------
-- Trigger Routers
------------------------------------------------------------------------------

-- a1pos_log

insert into sym_trigger_router 
(trigger_id,router_id,initial_load_order,initial_load_select,last_update_time,create_time)
values('a1pos_log','corp_2_a1pos_client', 100,'1=0', current_timestamp, current_timestamp);

insert into sym_trigger_router
(trigger_id,router_id,initial_load_order,last_update_time,create_time)
values('a1pos_log','a1pos_client_2_corp', 200, current_timestamp, current_timestamp);

-- android_log

insert into sym_trigger_router 
(trigger_id,router_id,initial_load_order,initial_load_select,last_update_time,create_time)
values('android_log','corp_2_android_client', 100,'1=0', current_timestamp, current_timestamp);

insert into sym_trigger_router
(trigger_id,router_id,initial_load_order,last_update_time,create_time)
values('android_log','android_client_2_corp', 200, current_timestamp, current_timestamp);

--employee

--insert into sym_trigger_router 
--(trigger_id,router_id,initial_load_order,last_update_time,create_time)
--values('employee','corp_2_client', 100, current_timestamp, current_timestamp);

--insert into sym_trigger_router
--(trigger_id,router_id,initial_load_order,last_update_time,create_time)
--values('employee','client_2_corp', 200, current_timestamp, current_timestamp);

--employee_call_log

insert into sym_trigger_router 
(trigger_id,router_id,initial_load_order,initial_load_select,last_update_time,create_time)
values('employee_call_log','corp_2_one_android_client', 100, 'device=''$(externalId)''', current_timestamp, current_timestamp);

insert into sym_trigger_router
(trigger_id,router_id,initial_load_order,last_update_time,create_time)
values('employee_call_log','android_client_2_corp', 200, current_timestamp, current_timestamp);

--employee_location

insert into sym_trigger_router 
(trigger_id,router_id,initial_load_order,initial_load_select,last_update_time,create_time)
values('employee_location','corp_2_android_client', 100, '1=0', current_timestamp, current_timestamp);

insert into sym_trigger_router
(trigger_id,router_id,initial_load_order,last_update_time,create_time)
values('employee_location','android_client_2_corp', 200, current_timestamp, current_timestamp);

--inventory

--insert into sym_trigger_router 
--(trigger_id,router_id,initial_load_order,last_update_time,create_time)
--values('inventory','corp_2_client', 100, current_timestamp, current_timestamp);

--insert into sym_trigger_router
--(trigger_id,router_id,initial_load_order,last_update_time,create_time)
--values('inventory','client_2_corp', 200, current_timestamp, current_timestamp);

--inventory_variance

--insert into sym_trigger_router 
--(trigger_id,router_id,initial_load_order,last_update_time,create_time)
--values('inventory_variance','corp_2_client', 100, current_timestamp, current_timestamp);

--insert into sym_trigger_router
--(trigger_id,router_id,initial_load_order,last_update_time,create_time)
--values('inventory_variance','client_2_corp', 200, current_timestamp, current_timestamp);

--item

--insert into sym_trigger_router 
--(trigger_id,router_id,initial_load_order,last_update_time,create_time)
--values('item','corp_2_client', 100, current_timestamp, current_timestamp);

--insert into sym_trigger_router
--(trigger_id,router_id,initial_load_order,last_update_time,create_time)
--values('item','client_2_corp', 200, current_timestamp, current_timestamp);

--merchant

--insert into sym_trigger_router 
--(trigger_id,router_id,initial_load_order,last_update_time,create_time)
--values('merchant','corp_2_client', 100, current_timestamp, current_timestamp);

--insert into sym_trigger_router
--(trigger_id,router_id,initial_load_order,last_update_time,create_time)
--values('merchant','client_2_corp', 200, current_timestamp, current_timestamp);

--merchant_item

--insert into sym_trigger_router 
--(trigger_id,router_id,initial_load_order,last_update_time,create_time)
--values('merchant_item','corp_2_client', 100, current_timestamp, current_timestamp);

--insert into sym_trigger_router
--(trigger_id,router_id,initial_load_order,last_update_time,create_time)
--values('merchant_item','client_2_corp', 200, current_timestamp, current_timestamp);

--pick_ticket

--insert into sym_trigger_router 
--(trigger_id,router_id,initial_load_order,last_update_time,create_time)
--values('pick_ticket','corp_2_client', 100, current_timestamp, current_timestamp);

--insert into sym_trigger_router
--(trigger_id,router_id,initial_load_order,last_update_time,create_time)
--values('pick_ticket','client_2_corp', 200, current_timestamp, current_timestamp);

--purchase_order

--insert into sym_trigger_router 
--(trigger_id,router_id,initial_load_order,last_update_time,create_time)
--values('purchase_order','corp_2_client', 100, current_timestamp, current_timestamp);

--insert into sym_trigger_router
--(trigger_id,router_id,initial_load_order,last_update_time,create_time)
--values('purchase_order','client_2_corp', 200, current_timestamp, current_timestamp);

--vendor

--insert into sym_trigger_router 
--(trigger_id,router_id,initial_load_order,last_update_time,create_time)
--values('vendor','corp_2_client', 100, current_timestamp, current_timestamp);

--insert into sym_trigger_router
--(trigger_id,router_id,initial_load_order,last_update_time,create_time)
--values('vendor','client_2_corp', 200, current_timestamp, current_timestamp);

