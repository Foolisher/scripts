
drop table groupon_copartner_infos;
create table groupon_copartner_infos(
   id                   bigint,
   user_id              bigint,
   user_name            string,
   shop_id              bigint,
   logo                 string,
   members              bigint,
   company_name         string,
   company_num          string,
   company_sld          string,
   company_record       string,
   key                  string,
   privilege            string,
   protection           boolean,
   limit_ref            tinyint,
   manager_id           bigint,
   manager_name         string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_user_images;
create table ecp_user_images(
   id                   bigint,
   user_id              bigint,
   path                 string,
   size                 int,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_notifications;
create table ecp_notifications(
   id                   bigint,
   audience_id          bigint,
   subject              string,
   content              string,
   checked              tinyint,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_agent_extras;
create table groupon_agent_extras(
   id                   bigint,
   user_id              bigint,
   user_name            string,
   status               tinyint,
   opening_bank         string,
   bank_card_account    string,
   bank_card_name       string,
   rate                 string,
   province_id          int,
   province             string,
   city_id              int,
   city                 string,
   region_id            int,
   region               string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_orders;
create table ecp_orders(
   id                   bigint,
   buyer_id             bigint,
   buyer_name           string,
   seller_id            bigint,
   seller_name          string,
   org_id               bigint,
   org_name             string,
   shop_name            string,
   business_id          bigint,
   business_name        string,
   status               int,
   type                 int,
   ship_fee             int,
   fee                  int,
   origin_fee           int,
   discount             int,
   pay_type             int,
   channel              tinyint,
   has_paid             boolean,
   has_comment          boolean,
   has_settle           boolean,
   created_at           string,
   updated_at           string,
   date                 string)
partitioned by(date string);

drop table ecp_item_details;
create table ecp_item_details(
   id                   bigint,
   item_id              bigint,
   image1               string,
   image2               string,
   image3               string,
   image4               string,
   packing              string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_additional_front_categories;
create table groupon_additional_front_categories(
   id                   bigint,
   parent_id            bigint,
   name                 string,
   level                boolean,
   has_children         boolean,
   favor_count          int,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_settlements_sum_of_daily;
create table ecp_settlements_sum_of_daily(
   id                   bigint,
   business_id          bigint,
   order_count          int,
   fee                  bigint,
   seller_earning       bigint,
   total_earning        bigint,
   total_expenditure    bigint,
   commission           bigint,
   score_earning        bigint,
   third_party_fee      bigint,
   summed_at            string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_skus;
create table ecp_skus(
   id                   bigint,
   outer_id             string,
   item_id              bigint,
   image                string,
   price                int,
   attribute_key1       string,
   attribute_name1      string,
   attribute_value1     string,
   attribute_key2       string,
   attribute_name2      string,
   attribute_value2     string,
   stock_quantity       int,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_user_profiles;
create table ecp_user_profiles(
   id                   bigint,
   user_id              bigint,
   realname             string,
   idcard               string,
   gender               boolean,
   province_id          int,
   province             string,
   city_id              int,
   city                 string,
   region_id            int,
   region               string,
   street               string,
   description          string,
   extra                string,
   channel              string,
   avatar               string,
   birth                string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_order_comments;
create table ecp_order_comments(
   id                   bigint,
   user_id              bigint,
   user_name            string,
   order_item_id        bigint,
   item_id              bigint,
   item_name            string,
   shop_id              bigint,
   shop_name            string,
   seller_id            bigint,
   quality              int,
   describe             int,
   service              int,
   express              int,
   context              string,
   reply                string,
   company_id           bigint,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_item_ship_fees;
create table ecp_item_ship_fees(
   id                   bigint,
   item_id              bigint,
   ship_fee             int,
   ship_fee_template_id bigint,
   ship_fee_template_name string,
   weight               int,
   volume               int,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_feedbacks;
create table groupon_feedbacks(
   id                   bigint,
   name                 string,
   feeder_id            bigint,
   feeder               string,
   gender               int,
   company              string,
   email                string,
   mobile               string,
   feeder_extra         string,
   content              string,
   type                 int,
   status               int,
   reply                string,
   opened_at            string,
   closed_at            string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_user_trade_infos;
create table ecp_user_trade_infos(
   id                   bigint,
   user_id              bigint,
   name                 string,
   status               int,
   phone                string,
   province             string,
   city                 string,
   region               string,
   province_id          int,
   city_id              int,
   region_id            int,
   street               string,
   zip                  string,
   is_default           boolean,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_acl_blacklists;
create table groupon_acl_blacklists(
   id                   bigint,
   copartner_info_id    bigint,
   copartner_info_name  string,
   forbidden_shop_id    bigint,
   forbidden_shop_name  string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_item_chop_price_activities;
create table groupon_item_chop_price_activities(
   id                   bigint,
   shop_id              bigint,
   seller_id            bigint,
   item_id              bigint,
   image                string,
   status               int,
   buy_count            int,
   notify_count         int,
   start_at             string,
   end_at               string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_third_party_users;
create table ecp_third_party_users(
   id                   bigint,
   user_id              bigint,
   corp_id              bigint,
   third_part_id        string,
   third_part_type      int,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_order_extras;
create table ecp_order_extras(
   id                   bigint,
   order_id             bigint,
   trade_info           string,
   buyer_notes          string,
   seller_notes         string,
   invoice              string,
   updated_at           string);

drop table groupon_agent_settlements_sum_of_copartner_dailys;
create table groupon_agent_settlements_sum_of_copartner_dailys(
   id                   bigint,
   agent_id             bigint,
   agent_name           string,
   copartner_info_id    bigint,
   copartner_info_name  string,
   order_count          int,
   fee                  bigint,
   origin_fee           bigint,
   total_expenditure    bigint,
   commission           bigint,
   agent_commission     bigint,
   third_party_fee      bigint,
   sum_id               bigint,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_item_snapshots;
create table ecp_item_snapshots(
   id                   bigint,
   item_id              bigint,
   item_name            string,
   seller_id            bigint,
   main_image           string,
   detail               string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_summary_users;
create table groupon_summary_users(
   id                   bigint,
   net_increase         bigint,
   total                bigint,
   channel              tinyint,
   sum_for              string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_club_activities;
create table groupon_club_activities(
   id                   bigint,
   owner_id             bigint,
   seller_id            bigint,
   copartner_info_id    bigint,
   activity_name        string,
   activity_banner      string,
   enter_image          string,
   status               int,
   start_at             string,
   end_at               string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_user_vat_invoices;
create table groupon_user_vat_invoices(
   id                   bigint,
   user_id              bigint,
   company_name         string,
   tax_register_no      string,
   register_address     string,
   register_phone       string,
   register_bank        string,
   bank_account         string,
   tax_certificate      string,
   taxpayer_certificate string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_mobile_whitelists;
create table groupon_mobile_whitelists(
   id                   bigint,
   mobile               string,
   copartner_info_id    bigint,
   copartner_name       string,
   external             boolean,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_coupons;
create table groupon_coupons(
   id                   bigint,
   user_id              bigint,
   remain_quantity      int,
   used_quantity        int,
   seller_id            bigint,
   item_id              bigint,
   picture              string,
   seller_name          string,
   shop_name            string,
   coupon_def_id        bigint,
   coupon_name          string,
   discount             int,
   base_money           int,
   base_quantity        int,
   most_use_quantity    int,
   per_money            int,
   start_at             string,
   end_at               string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_register_refs;
create table groupon_register_refs(
   id                   bigint,
   referrer_id          bigint,
   item_id              bigint,
   referrer_email       string,
   referrer_phone       string,
   referrer_name        string,
   invited_id           bigint,
   invitee_name         string,
   invitee              string,
   status               tinyint,
   type                 tinyint,
   method               tinyint,
   data                 string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_spus;
create table ecp_spus(
   id                   bigint,
   category_id          bigint,
   name                 string,
   status               boolean,
   brand_id             bigint,
   brand_name           string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_copartner_summaries;
create table groupon_copartner_summaries(
   id                   bigint,
   copartner_info_id    bigint,
   agent_id             bigint,
   order_count          bigint,
   fee                  bigint,
   agent_commission     bigint,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_withdraws_sum_of_shop_daily;
create table ecp_withdraws_sum_of_shop_daily(
   id                   bigint,
   seller_id            bigint,
   seller_name          string,
   shop_id              bigint,
   shop_name            string,
   fee                  bigint,
   total_fee            bigint,
   third_party_fee      bigint,
   refund_fee           bigint,
   cash_fee             bigint,
   traded_at            string,
   summed_at            string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_order_items;
create table ecp_order_items(
   id                   bigint,
   order_id             bigint,
   buyer_id             bigint,
   seller_id            bigint,
   brand_id             bigint,
   business_id          bigint,
   ship_fee             int,
   fee                  int,
   origin_fee           int,
   discount             int,
   sku_id               bigint,
   outer_sku_id         string,
   item_id              bigint,
   item_name            string,
   item_image           string,
   quantity             int,
   type                 int,
   status               int,
   pay_type             int,
   can_refund           boolean,
   is_refunding         boolean,
   created_at           string,
   updated_at           string,
   date                 string)
partitioned by(date string);

drop table ecp_alipay_trans;
create table ecp_alipay_trans(
   id                   bigint,
   balance              string,
   bank_account_name    string,
   bank_account_no      string,
   bank_name            string,
   buyer_name           string,
   buyer_account        string,
   currency             string,
   deposit_bank_no      string,
   income               string,
   iw_account_log_id    string,
   memo                 string,
   merchant_out_order_no string,
   other_account_email  string,
   other_account_fullname string,
   other_user_id        string,
   outcome              string,
   partner_id           string,
   seller_account       string,
   seller_fullname      string,
   service_fee          string,
   service_fee_ratio    string,
   total_fee            string,
   trade_no             string,
   trade_refund_amount  string,
   trans_account        string,
   trans_code_msg       string,
   trans_date           string,
   trans_out_order_no   string,
   sub_trans_code_msg   string,
   sign_product_name    string,
   rate                 string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_summary_agents;
create table groupon_summary_agents(
   id                   bigint,
   agent_id             bigint,
   agent_name           string,
   deal                 bigint,
   orders               int,
   commission           bigint,
   copartners           int,
   users                int,
   type                 int,
   region               string,
   entry_at             string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_wechatpay_trans;
create table ecp_wechatpay_trans(
   id                   bigint,
   transaction_id       string,
   out_trade_no         string,
   trade_status         string,
   trade_time           string,
   appid                string,
   mch_id               string,
   sub_mch_id           string,
   device_info          string,
   open_id              string,
   trade_type           string,
   bank_type            string,
   fee_type             string,
   total_fee            string,
   coupon_fee           string,
   refund_apply_date    string,
   refund_success_date  string,
   refund_id            string,
   out_refund_no        string,
   refund_fee           string,
   coupon_refund_fee    string,
   refund_channel       string,
   refund_status        string,
   body                 string,
   attach               string,
   poundage_fee         string,
   rate                 string);

drop table groupon_copartners;
create table groupon_copartners(
   id                   bigint,
   copartner_info_id    bigint,
   suffix               string,
   verify_url           string,
   description          string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_agent_settlements_sum_of_dailys;
create table groupon_agent_settlements_sum_of_dailys(
   id                   bigint,
   agent_id             bigint,
   agent_name           string,
   order_count          int,
   fee                  bigint,
   origin_fee           bigint,
   total_expenditure    bigint,
   commission           bigint,
   agent_commission     bigint,
   third_party_fee      bigint,
   payed                boolean,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_category_bindings;
create table ecp_category_bindings(
   id                   bigint,
   front_category_id    bigint,
   back_category_id     bigint,
   path                 string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table mocked_alipay_trans;
create table mocked_alipay_trans(
   id                   bigint,
   balance              string,
   bank_account_name    string,
   bank_account_no      string,
   bank_name            string,
   buyer_name           string,
   buyer_account        string,
   currency             string,
   deposit_bank_no      string,
   income               string,
   iw_account_log_id    string,
   memo                 string,
   merchant_out_order_no string,
   other_account_email  string,
   other_account_fullname string,
   other_user_id        string,
   outcome              string,
   partner_id           string,
   seller_account       string,
   seller_fullname      string,
   service_fee          string,
   service_fee_ratio    string,
   total_fee            string,
   trade_no             string,
   trade_refund_amount  string,
   trans_account        string,
   trans_code_msg       string,
   trans_date           string,
   trans_out_order_no   string,
   sub_trans_code_msg   string,
   sign_product_name    string,
   rate                 string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_special_addresses;
create table ecp_special_addresses(
   id                   bigint,
   user_id              bigint,
   ship_fee_template_id bigint,
   addresses            string,
   init_amount          int,
   init_price           int,
   incr_amount          int,
   incr_price           int,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_activity_coupons;
create table groupon_activity_coupons(
   id                   bigint,
   type                 int,
   description          string,
   coupon_def_id        bigint,
   coupon_name          string,
   coupon_quantity      int,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_summary_deals;
create table groupon_summary_deals(
   id                   bigint,
   gmv                  bigint,
   gross_order          bigint,
   gross_item           bigint,
   deal                 bigint,
   per_order            bigint,
   deal_order           bigint,
   deal_item            bigint,
   sum_for              string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_deposit_accounts;
create table groupon_deposit_accounts(
   id                   bigint,
   seller_id            bigint,
   seller_name          string,
   shop_id              bigint,
   shop_name            string,
   business_id          bigint,
   deposit              bigint,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_back_categories;
create table ecp_back_categories(
   id                   bigint,
   pid                  bigint,
   name                 string,
   level                boolean,
   status               boolean,
   has_children         boolean,
   has_spu              boolean,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_shop_extras;
create table groupon_shop_extras(
   id                   bigint,
   shop_id              bigint,
   seller_id            bigint,
   shop_key             string,
   deposit_cost         bigint,
   rate                 int,
   account              string,
   account_type         int,
   account_name         string,
   bank_name            string,
   talker_one           string,
   talker_two           string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_settlement_items;
create table groupon_settlement_items(
   id                   bigint,
   order_id             bigint,
   origin_fee           bigint,
   seller_expenditure   bigint,
   ship_fee             bigint,
   receivable           bigint,
   system_expenditure   bigint,
   fee                  bigint,
   seller_earning       bigint,
   total_expenditure    bigint,
   commission           bigint,
   score_earning        bigint,
   third_party_fee      bigint,
   source_type          int,
   description          string,
   agent_commission     bigint,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_order_tracks;
create table ecp_order_tracks(
   id                   bigint,
   paid_id              bigint,
   seller_id            bigint,
   order_id             bigint,
   trade_no             string,
   pay_code             string,
   channel              string,
   openid               string,
   type                 int,
   pay_type             int,
   status               int,
   paid_at              string,
   buyer_cancel_at      string,
   seller_cancel_at     string,
   deliver_at           string,
   waybill_no           string,
   logistics_type       int,
   logistics_code       string,
   logistics_company    string,
   done_at              string,
   finish_at            string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_buyer_favors;
create table groupon_buyer_favors(
   id                   bigint,
   type                 tinyint,
   buyer_id             bigint,
   outer_id             bigint,
   outer_name           string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_express_infos;
create table ecp_express_infos(
   id                   bigint,
   name                 string,
   code                 string,
   status               int,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_front_categories;
create table ecp_front_categories(
   id                   bigint,
   pid                  bigint,
   name                 string,
   level                boolean,
   has_children         boolean,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_sms_tracks;
create table groupon_sms_tracks(
   id                   bigint,
   session_id           string,
   mobile               string,
   deal_type            int,
   send_type            int,
   send_times           int,
   copartner_info_id    bigint,
   company_name         string,
   receive_id           bigint,
   receive_name         string,
   sender_id            bigint,
   sender_name          string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_settlement_items;
create table ecp_settlement_items(
   id                   bigint,
   order_id             bigint,
   order_item_id        bigint,
   seller_id            bigint,
   buyer_id             bigint,
   buyer_name           string,
   business_id          bigint,
   brand_id             bigint,
   item_name            string,
   item_quantity        int,
   type                 int,
   pay_type             int,
   trade_status         int,
   fee                  bigint,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_settlement_abnormal_tracks;
create table groupon_settlement_abnormal_tracks(
   id                   bigint,
   order_id             bigint,
   seller_id            bigint,
   seller_name          string,
   shop_id              bigint,
   shop_name            string,
   channel              string,
   type                 int,
   pay_type             int,
   order_status         int,
   merge_paid           boolean,
   payment_code         string,
   trade_no             string,
   origin_fee           bigint,
   ship_fee             bigint,
   fee                  bigint,
   description          string,
   is_handle            boolean,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_withdraws;
create table ecp_withdraws(
   id                   bigint,
   order_id             bigint,
   order_item_id        bigint,
   seller_id            bigint,
   seller_name          string,
   shop_id              bigint,
   shop_name            string,
   buyer_id             bigint,
   buyer_name           string,
   type                 int,
   pay_type             int,
   fee                  bigint,
   total_fee            bigint,
   third_party_fee      bigint,
   refund_fee           bigint,
   cash_fee             bigint,
   status               boolean,
   operator             string,
   traded_at            string,
   cashed_at            string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_subscript_definitions;
create table groupon_subscript_definitions(
   id                   bigint,
   item_id              bigint,
   seller_id            bigint,
   main_image           string,
   video_url            string,
   status               int,
   tag                  int,
   subscript_end_at     string,
   activity_end_at      string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_settlements_sum_of_shop_dailys;
create table groupon_settlements_sum_of_shop_dailys(
   id                   bigint,
   seller_id            bigint,
   seller_name          string,
   shop_id              bigint,
   shop_name            string,
   business_id          bigint,
   business_name        string,
   order_count          int,
   fee                  bigint,
   seller_earning       bigint,
   origin_fee           bigint,
   seller_expenditure   bigint,
   ship_fee             bigint,
   receivable           bigint,
   system_expenditure   bigint,
   total_expenditure    bigint,
   commission           bigint,
   agent_commission     bigint,
   received_commission  bigint,
   score_earning        bigint,
   third_party_fee      bigint,
   sum_id               bigint,
   payed                boolean,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_marketing_mobiles;
create table groupon_marketing_mobiles(
   id                   bigint,
   mobile               string,
   copartner_info_id    bigint,
   sent                 tinyint);

drop table ecp_addresses;
create table ecp_addresses(
   id                   bigint,
   pid                  int,
   name                 string,
   level                boolean);

drop table ecp_settlements;
create table ecp_settlements(
   id                   bigint,
   order_id             bigint,
   seller_id            bigint,
   seller_name          string,
   shop_id              bigint,
   shop_name            string,
   buyer_id             bigint,
   buyer_name           string,
   business_id          bigint,
   type                 int,
   pay_type             int,
   order_status         int,
   multi_paid           boolean,
   pay_code             string,
   fee                  bigint,
   seller_earning       bigint,
   total_earning        bigint,
   total_expenditure    bigint,
   commission           bigint,
   commission_rate      int,
   score_earning        bigint,
   third_party_fee      bigint,
   third_party_rate     int,
   settle_status        int,
   cashed               boolean,
   finished             boolean,
   settled              boolean,
   ordered_at           string,
   paid_at              string,
   finished_at          string,
   settled_at           string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_shops;
create table ecp_shops(
   id                   bigint,
   user_id              bigint,
   username             string,
   name                 string,
   status               boolean,
   phone                string,
   shop_business_id     bigint,
   shop_business_name   string,
   image_url            string,
   province             string,
   province_id          int,
   city                 string,
   city_id              int,
   region               string,
   region_id            int,
   street               string,
   is_cod               boolean,
   is_einvoice          boolean,
   is_vatinvoice        boolean,
   service_score        bigint,
   express_score        bigint,
   quality_score        bigint,
   describe_score       bigint,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_company_trade_infos;
create table groupon_company_trade_infos(
   id                   bigint,
   seller_id            bigint,
   company_id           bigint,
   name                 string,
   status               int,
   phone                string,
   province             string,
   city                 string,
   region               string,
   province_id          int,
   city_id              int,
   region_id            int,
   street               string,
   zip                  string,
   is_default           boolean,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_company_vat_invoices;
create table groupon_company_vat_invoices(
   id                   bigint,
   company_id           bigint,
   company_name         string,
   tax_register_no      string,
   register_address     string,
   register_phone       string,
   register_bank        string,
   bank_account         string,
   tax_certificate      string,
   taxpayer_certificate string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_shop_item_categories;
create table ecp_shop_item_categories(
   id                   bigint,
   shop_id              bigint,
   categories           string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_shop_scores;
create table ecp_shop_scores(
   id                   bigint,
   shop_id              bigint,
   service_score        bigint,
   express_score        bigint,
   describe_score       bigint,
   quality_score        bigint,
   total_count          bigint,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_settlements;
create table groupon_settlements(
   id                   bigint,
   order_id             bigint,
   copartner_info_id    bigint,
   copartner_info_name  string,
   agent_id             bigint,
   agent_name           string,
   seller_id            bigint,
   seller_name          string,
   shop_id              bigint,
   shop_name            string,
   buyer_id             bigint,
   buyer_name           string,
   business_id          bigint,
   business_name        string,
   type                 int,
   pay_type             int,
   order_status         int,
   merge_paid           boolean,
   payment_code         string,
   trade_no             string,
   origin_fee           bigint,
   seller_expenditure   bigint,
   ship_fee             bigint,
   receivable           bigint,
   system_expenditure   bigint,
   fee                  bigint,
   seller_earning       bigint,
   total_expenditure    bigint,
   commission           bigint,
   commission_rate      int,
   received_commission  bigint,
   score_earning        bigint,
   third_party_fee      bigint,
   third_party_rate     int,
   settle_status        int,
   channel              string,
   sum_shop_id          bigint,
   sum_copartner_id     bigint,
   agent_commission_rate int,
   agent_commission     bigint,
   ordered_at           string,
   paid_at              string,
   finished_at          string,
   done_at              string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_ship_fee_templates;
create table ecp_ship_fee_templates(
   id                   bigint,
   user_id              bigint,
   name                 string,
   bear_fee             boolean,
   valuation            boolean,
   init_amount          int,
   init_price           int,
   incr_amount          int,
   incr_price           int,
   has_special_region   boolean,
   ship                 boolean,
   deleted              boolean,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_coupon_definitions;
create table groupon_coupon_definitions(
   id                   bigint,
   name                 string,
   discount             int,
   type                 int,
   picture              string,
   seller_id            bigint,
   item_id              bigint,
   item_name            string,
   seller_name          string,
   shop_name            string,
   status               int,
   base_money           int,
   base_quantity        int,
   most_use_quantity    int,
   per_money            int,
   used_quantity        int,
   given_quantity       int,
   start_at             string,
   end_at               string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_summary_references;
create table groupon_summary_references(
   id                   bigint,
   registered           bigint,
   activated            bigint,
   total                bigint,
   type                 tinyint,
   sum_for              string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_brands;
create table ecp_brands(
   id                   bigint,
   name                 string,
   description          string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_user_extras;
create table groupon_user_extras(
   id                   bigint,
   user_id              bigint,
   copartner_info_id    bigint,
   copartner_name       string,
   has_synced           boolean,
   open_id              string,
   activate_url         string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_settlements_sum_of_dailys;
create table groupon_settlements_sum_of_dailys(
   id                   bigint,
   order_count          int,
   fee                  bigint,
   seller_earning       bigint,
   origin_fee           bigint,
   seller_expenditure   bigint,
   ship_fee             bigint,
   receivable           bigint,
   system_expenditure   bigint,
   total_expenditure    bigint,
   commission           bigint,
   agent_commission     bigint,
   received_commission  bigint,
   score_earning        bigint,
   third_party_fee      bigint,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_order_item_refund_tracks;
create table ecp_order_item_refund_tracks(
   id                   bigint,
   order_id             bigint,
   order_item_id        bigint,
   buyer_id             bigint,
   seller_id            bigint,
   type                 int,
   track_type           int,
   status               int,
   pay_type             int,
   reason               string,
   after_sale_refuse_reason string,
   refund_amount        int,
   request_refund_at    string,
   request_return_goods_at string,
   refund_at            string,
   waybill_no           string,
   logistics_type       int,
   logistics_code       string,
   logistics_company    string,
   return_goods_at      string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_staff_whitelists;
create table groupon_staff_whitelists(
   id                   bigint,
   work_no              string,
   card_no              string,
   copartner_info_id    bigint,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_club_item_discounts;
create table groupon_club_item_discounts(
   id                   bigint,
   item_id              bigint,
   seller_id            bigint,
   item_name            string,
   item_image           string,
   item_price           int,
   origin_price         int,
   special_price        int,
   discount_percent     int,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table schema_versions;
create table schema_versions(
   version_rank         int,
   installed_rank       int,
   version              string,
   description          string,
   type                 string,
   script               string,
   checksum             int,
   installed_by         string,
   installed_on         string,
   execution_time       int,
   success              boolean);

drop table groupon_logistics_infos;
create table groupon_logistics_infos(
   id                   bigint,
   order_id             bigint,
   order_item_id        bigint,
   status               int,
   datetime             string,
   content              string);

drop table ecp_items;
create table ecp_items(
   id                   bigint,
   spu_id               bigint,
   user_id              bigint,
   shop_id              bigint,
   shop_name            string,
   brand_id             bigint,
   brand_name           string,
   name                 string,
   main_image           string,
   price                int,
   origin_price         int,
   stock_quantity       int,
   sale_quantity        int,
   province_id          int,
   city_id              int,
   region_id            int,
   status               boolean,
   on_shelf_at          string,
   off_shelf_at         string,
   remark               string,
   model                string,
   created_at           string,
   updated_at           string,
   market_tag           string,
   extra                string)
partitioned by(date string);

drop table groupon_after_sales_settlements;
create table groupon_after_sales_settlements(
   id                   bigint,
   order_id             bigint,
   order_item_id        bigint,
   seller_id            bigint,
   seller_name          string,
   shop_id              bigint,
   shop_name            string,
   buyer_id             bigint,
   buyer_name           string,
   business_id          bigint,
   business_name        string,
   status               int,
   reason               string,
   refund_amount        int,
   is_deducted          boolean,
   deducted_at          string,
   description          string,
   request_refund_at    string,
   request_return_goods_at string,
   refund_at            string,
   return_goods_at      string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_order_club_item_discounts;
create table groupon_order_club_item_discounts(
   id                   bigint,
   order_id             bigint,
   order_item_id        bigint,
   sku_id               bigint,
   item_id              bigint,
   sku_price            int,
   club_sku_price       int,
   discount             int,
   quantity             int,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_item_pricevses;
create table groupon_item_pricevses(
   id                   bigint,
   item_id              bigint,
   prices               string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_item_templates;
create table ecp_item_templates(
   id                   bigint,
   spu_id               bigint,
   name                 string,
   price                int,
   main_image           string,
   image1               string,
   image2               string,
   image3               string,
   image4               string,
   json_skus            string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_additional_brands;
create table groupon_additional_brands(
   id                   bigint,
   name                 string,
   first_letter         string,
   favor_count          int,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_summary_orders;
create table groupon_summary_orders(
   id                   bigint,
   total_fee            bigint,
   per_order            bigint,
   total_quantity       bigint,
   total_order          bigint,
   sum_for              string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_users;
create table ecp_users(
   id                   bigint,
   nickname             string,
   passwd               string,
   mobile               string,
   email                string,
   type                 boolean,
   status               boolean,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_email_tracks;
create table groupon_email_tracks(
   id                   bigint,
   email                string,
   type                 boolean,
   status               boolean,
   copartner_info_id    bigint,
   company_name         string,
   domain               string,
   user_id              bigint,
   user_name            string,
   register_ref_id      bigint,
   invite_name          string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_coupon_usages;
create table groupon_coupon_usages(
   id                   bigint,
   buyer_id             bigint,
   buyer_name           string,
   seller_id            bigint,
   shop_name            string,
   discount             int,
   used_quantity        int,
   order_id             bigint,
   coupon_def_id        bigint,
   coupon_name          string,
   coupon_type          int,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_shop_businesses;
create table ecp_shop_businesses(
   id                   bigint,
   name                 string,
   rate                 int,
   outer_id             bigint,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_settlements_sum_of_shop_daily;
create table ecp_settlements_sum_of_shop_daily(
   id                   bigint,
   seller_id            bigint,
   seller_name          string,
   shop_id              bigint,
   shop_name            string,
   business_id          bigint,
   order_count          int,
   fee                  bigint,
   seller_earning       bigint,
   total_earning        bigint,
   total_expenditure    bigint,
   commission           bigint,
   score_earning        bigint,
   third_party_fee      bigint,
   summed_at            string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_withdraws_sum_of_daily;
create table ecp_withdraws_sum_of_daily(
   id                   bigint,
   fee                  bigint,
   total_fee            bigint,
   third_party_fee      bigint,
   refund_fee           bigint,
   cash_fee             bigint,
   traded_at            string,
   summed_at            string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_club_activity_owners;
create table groupon_club_activity_owners(
   id                   bigint,
   seller_id            bigint,
   copartner_info_id    bigint,
   company_name         string,
   activity_count       int,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_deposit_details;
create table groupon_deposit_details(
   id                   bigint,
   user_id              bigint,
   seller_id            bigint,
   seller_name          string,
   shop_id              bigint,
   shop_name            string,
   business_id          bigint,
   type                 int,
   deposit              bigint,
   description          string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table ecp_order_pays;
create table ecp_order_pays(
   id                   bigint,
   trade_no             string,
   order_id             bigint,
   order_ids            string,
   order_type           tinyint,
   subject              string,
   content              string,
   fee                  int,
   channel              string,
   payment_code         string,
   paid_type            tinyint,
   paid_status          tinyint,
   multi                boolean,
   expired_at           string,
   paid_at              string,
   created_at           string,
   updated_at           string)
partitioned by(date string);

drop table groupon_sku_extras;
create table groupon_sku_extras(
   id                   bigint,
   item_id              bigint,
   sku_id               bigint,
   special_price        int,
   created_at           string,
   updated_at           string)
partitioned by(date string);

