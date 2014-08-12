class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :company_url
      t.string :company_summary
      t.string :company_logo_url
      t.string :company_facebook
      t.string :company_twitter
      t.string :str_address_1
      t.string :str_address_2
      t.string :company_city
      t.string :company_state
      t.string :company_zip
      t.string :company_linkedIn
      t.string :primary_contact_email
      t.string :primary_contact_first_name
      t.string :primary_contact_last_name
      t.string :primary_contact_position
      t.string :primary_contact_phone
      t.string :tm1_email
      t.string :tm1_first_name
      t.string :tm1_last_name
      t.string :tm1_position
      t.string :tm2_email
      t.string :tm2_first_name
      t.string :tm2_last_name
      t.string :tm2_position
      t.string :tm3_email
      t.string :tm3_first_name
      t.string :tm3_last_name
      t.string :tm3_position
      t.boolean :updated, default: false
      t.string :table_row
      t.string :obfuscated_id

    end
  end
end
