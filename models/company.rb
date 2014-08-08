class Company

  require 'google_drive'
  require 'SecureRandom'

  attr_accessor :info

  def initialize(company_row)
    @row = company_row.to_i

    @session= GoogleDrive.login("matthewr@gust.com","southbeachbrickell!")
    @spreadsheet= @session.spreadsheet_by_key("1QpxdZnqnHttGKjPS1sfqDvhhDjAt30SqrzK0i0M5DL0").worksheets[0]
    @column_index = get_column_index
    @info = get_spreadsheet_info
    binding.pry
  end

  def save_changes(updates)
    @spreadsheet= @session.spreadsheet_by_key("1QpxdZnqnHttGKjPS1sfqDvhhDjAt30SqrzK0i0M5DL0").worksheets[0]
    column_index = get_column_index
    updates.each do |attribute, update|
      if update != ""
        @spreadsheet[@row, column_index[attribute]] = update
      end
    end

    @spreadsheet.save()
  end

  private

  def get_column_index

    index = {}
    index["company_name"] = 1
    index["company_url"] = 2
    index["company_summary"]= 7
    index [ "company_logo_url" ] = 8
    index [ "company_facebook" ]= 16
    index [ "company_twitter" ] = 17
    index [ "str_address_1" ] = 10
    index [ "str_address_2" ] = 11
    index ["company_city"] = 12
    index ["company_state"] = 13
    index["company_zip"]= 14
    index["company_linkedIn"] = 16
    index["primary_contact_email"] = 18
    index["primary_contact_first_name"] = 19
    index["primary_contact_last_name"] = 20
    index["primary_contact_position"] = 21
    index["primary_contact_phone"] = 23
    index["tm1_email"] = 29
    index["tm1_first_name"] = 26
    index["tm1_last_name"] = 27
    index["tm1_position"] = 28
    index
  end

  def get_spreadsheet_info
    @spreadsheet_info = {}
    get_column_index.each do |attribute,column|
      @spreadsheet_info[attribute] =  @spreadsheet[@row,column]
    end
    @spreadsheet_info
  end

end
