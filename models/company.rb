class Company < ActiveRecord::Base

  require 'google_drive'
  require 'securerandom'


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
end
