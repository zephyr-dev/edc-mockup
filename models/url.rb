class Url < ActiveRecord::Base
  require 'SecureRandom'


  def self.generate_urls

    @session= GoogleDrive.login("matthewr@gust.com",ENV['GMAIL_PASSWORD'])
    @spreadsheet= @session.spreadsheet_by_key("1QpxdZnqnHttGKjPS1sfqDvhhDjAt30SqrzK0i0M5DL0").worksheets[0]
     @spreadsheet.num_rows.times do  |row|
      Url.create(table_row: row, obfuscated_id: SecureRandom.uuid)
    end

  end
end
