class Company < ActiveRecord::Base

  require 'google_drive'
  require 'SecureRandom'

  attr_accessor :info
  # def initialize(company_row)
  # @row = company_row

  # @session= GoogleDrive.login("matthewr@gust.com",ENV["GMAIL_PASSWORD"])
  # @spreadsheet= @session.spreadsheet_by_key(ENV["SPREADSHEET_KEY"]).worksheets[0]
  # @column_index = get_column_index
  # @info = get_spreadsheet_info
  # end

  def save_changes(updates)
    column_index = get_column_index
    updates.each do |attribute, update|
      if update != ""
        @spreadsheet[column_index[attribute] + @row] = update
      end
    end

    @spreadsheet.save()
  end


  def team_members_count(company)
    if  company.tm1_first_name != ""
      if  company.tm2_first_name  != ""
        if  company.tm3_first_name  != ""
          3
        else
          2
        end
      else
        1
      end
    else
      0
    end
  end

  def self.generate_companies

    index = Reference.get_column_index
    @session= GoogleDrive.login("matthewr@gust.com",ENV['GMAIL_PASSWORD'])
    spreadsheet= @session.spreadsheet_by_key(ENV["SPREADSHEET_KEY"]).worksheets[0]
    spreadsheet.num_rows.times do  |current_row|
      current_row +=1
      company = Company.new do |c|
        Reference.get_spreadsheet_info(spreadsheet,current_row).each do |attribute,column|
          c.send("#{attribute}=", spreadsheet[index[attribute]+current_row.to_s])
        end
        c.table_row = current_row
        c.obfuscated_id = SecureRandom.uuid
      end
      company.save
    end
  end

  private

  def get_column_index

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

  def get_spreadsheet_info(spreadsheet,current_row)
    spreadsheet_info = {}
    get_column_index.each do |attribute,column|
      spreadsheet_info[attribute] =  spreadsheet[column + current_row]
    end
    spreadsheet_info
  end

end
