class ChangeStringToText < ActiveRecord::Migration
  def change
      change_column :companies,:company_name, :text
      change_column :companies,:company_url, :text
      change_column :companies,:company_summary, :text
      change_column :companies,:company_logo_url, :text
      change_column :companies,:company_facebook, :text
      change_column :companies,:company_twitter, :text
      change_column :companies,:str_address_1, :text
      change_column :companies,:str_address_2, :text
      change_column :companies,:company_city, :text
      change_column :companies,:company_state, :text
      change_column :companies,:company_zip, :text
      change_column :companies,:company_linkedIn, :text
      change_column :companies,:primary_contact_email, :text
      change_column :companies,:primary_contact_first_name, :text
      change_column :companies,:primary_contact_last_name, :text
      change_column :companies,:primary_contact_position, :text
      change_column :companies,:primary_contact_phone, :text
      change_column :companies,:tm1_email, :text
      change_column :companies,:tm1_first_name, :text
      change_column :companies,:tm1_last_name, :text
      change_column :companies,:tm1_position, :text
      change_column :companies,:tm2_email, :text
      change_column :companies,:tm2_first_name, :text
      change_column :companies,:tm2_last_name, :text
      change_column :companies,:tm2_position, :text
      change_column :companies,:tm3_email, :text
      change_column :companies,:tm3_first_name, :text
      change_column :companies, :tm3_last_name, :text
      change_column :companies,:tm3_position, :text
    end
  end
