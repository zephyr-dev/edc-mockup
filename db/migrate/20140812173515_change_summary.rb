class ChangeSummary < ActiveRecord::Migration
  def change
    change_column :companies, :company_summary, :text
  end
end
