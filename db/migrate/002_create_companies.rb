class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |c|
      c.string :name
    end
  end
end
