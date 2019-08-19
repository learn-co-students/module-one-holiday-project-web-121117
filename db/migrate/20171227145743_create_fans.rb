class CreateFans < ActiveRecord::Migration[5.0]
  def change
    create_table :fans do |t|
      t.string :name
      t.integer :age
      t.string :state
      t.string :occupation
      t.string :marrital_status
      t.string :sex
      t.string :education_level
    end
  end
end
