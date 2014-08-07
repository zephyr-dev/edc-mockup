class Company

  require 'google_drive'

  attr_accessor :company_name, :company_url,:company_summary, :company_logo_url, :company_facebook, :company_twitter
  attr_accessor :str_address_1, :str_address_2, :company_city, :company_state, :company_zip, :company_linkedIn
  attr_accessor :primary_contact_email, :primary_contact_first_name, :primary_contact_last_name, :primary_contact_position, :primary_contact_phone
  attr_accessor :tm1_email, :tm1_first_name, :tm1_last_name, :tm1_position, :tm1_phone

  def initialize(company_row)
    @row = company_row
    session= GoogleDrive.login("matthewr@gust.com","southbeachbrickell!")
    @spreadsheet= session.spreadsheet_by_key("1QpxdZnqnHttGKjPS1sfqDvhhDjAt30SqrzK0i0M5DL0").worksheets[0]
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

  def say_name
    puts @row
  end

end
