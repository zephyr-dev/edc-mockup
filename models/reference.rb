class Reference

  def self.get_column_index

    index = {}
    index["company_name"] = 'a'
    index["company_url"] = 'b'
    index["company_summary"]= 'g'
    index [ "company_logo_url" ] = 'h'
    index [ "company_facebook" ]= 'p'
    index [ "company_twitter" ] = 'q'
    index [ "str_address_1" ] = 'j'
    index [ "str_address_2" ] = 'k'
    index ["company_city"] = 'l'
    index ["company_state"] = 'm'
    index["company_zip"]= 'n'
    index["company_linkedIn"] = 'o'
    index["primary_contact_email"] = 'r'
    index["primary_contact_first_name"] = 's'
    index["primary_contact_last_name"] = 't'
    index["primary_contact_position"] = 'u'
    index["primary_contact_phone"] = 'w'
    index["tm1_email"] = 'ac'
    index["tm1_first_name"] = 'z'
    index["tm1_last_name"] = 'aa'
    index["tm1_position"] = 'ab'
    index["tm2_email"] = 'ag'
    index["tm2_first_name"] = 'ad'
    index["tm2_last_name"] = 'ae'
    index["tm2_position"] = 'af'
    index["tm3_email"] = 'ak'
    index["tm3_first_name"] = 'ah'
    index["tm3_last_name"] = 'ai'
    index["tm3_position"] = 'aj'
    index
  end

  def self.get_spreadsheet_info(spreadsheet,current_row)
    spreadsheet_info = {}
    Reference.get_column_index.each do |attribute,column|
      spreadsheet_info[attribute] =  spreadsheet[column + current_row.to_s]
    end
    spreadsheet_info
  end

end
