class Company

  require 'google_drive'

  attr_accessor :company_name, :company_url,:company_summary, :company_logo_url, :company_facebook, :company_twitter
  attr_accessor :str_address_1, :str_address_2, :company_city, :company_state, :company_zip, :company_linkedIn
  attr_accessor :primary_contact_email, :primary_contact_first_name, :primary_contact_last_name, :primary_contact_position, :primary_contact_phone
  attr_accessor :tm1_email, :tm1_first_name, :tm1_last_name, :tm1_position, :tm1_phone

  def initialize(company_row)
    @row = company_row.to_i
    @session= GoogleDrive.login("matthewr@gust.com","southbeachbrickell!")
    @spreadsheet= @session.spreadsheet_by_key("1QpxdZnqnHttGKjPS1sfqDvhhDjAt30SqrzK0i0M5DL0").worksheets[0]
    @column_index = get_column_index

  end

  def get_info
    # @spreadsheet= @session.spreadsheet_by_key("1QpxdZnqnHttGKjPS1sfqDvhhDjAt30SqrzK0i0M5DL0").worksheets[0]
    # x = @spreadsheet[@row,@column_index[attribute]]
# binding.pry



    @company_name = @spreadsheet[@row.to_i,1]
    @company_url = @spreadsheet[@row.to_i,2]
    @company_summary= @spreadsheet[@row.to_i,7]
    @company_logo_url = @spreadsheet[@row.to_i,8]
    @company_facebook= @spreadsheet[@row.to_i,16]
    @company_twitter = @spreadsheet[@row.to_i,17]
    @str_address_1 = @spreadsheet[@row.to_i,10]
    @str_address_2 = @spreadsheet[@row.to_i,11]
    @company_city = @spreadsheet[@row.to_i,12]
    @company_state = @spreadsheet[@row.to_i,13]
    @company_zip = @spreadsheet[@row.to_i,14]
    @company_linkedIn = @spreadsheet[@row.to_i,16]
    @primary_contact_email = @spreadsheet[@row.to_i,18]
    @primary_contact_first_name = @spreadsheet[@row.to_i,19]
    @primary_contact_last_name = @spreadsheet[@row.to_i,20]
    @primary_contact_position = @spreadsheet[@row.to_i,21]
    @primary_contact_phone = @spreadsheet[@row.to_i,23]
    @tm1_email = @spreadsheet[@row.to_i,29]
    @tm1_first_name = @spreadsheet[@row.to_i,26]
    @tm1_last_name = @spreadsheet[@row.to_i,27]
    @tm1_position = @spreadsheet[@row.to_i,28]

  end

  def save_changes(updates)
    @spreadsheet= @session.spreadsheet_by_key("1QpxdZnqnHttGKjPS1sfqDvhhDjAt30SqrzK0i0M5DL0").worksheets[0]
    column_index = get_column_index
    binding.pry
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
end
