class Company < ActiveRecord::Base

  require 'google_drive'
  require 'securerandom'
  require 'csv'


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

  def self.generate_spreadsheet

    @companies = Company.where(updated: true)
    attributes = []
    Reference.get_column_index.each do |attribute, letter|
      attributes << attribute

    end
    CSV.open("updated.csv","wb") do |csv|
      csv << attributes
      @companies.each do |company|
        current_company = []
        attributes.each do |attribute|
          current_company << company.send("#{attribute}")
        end
        csv << current_company
      end
    end

  end
end
