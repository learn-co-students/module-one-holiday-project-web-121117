class AddCatnoToReleases < ActiveRecord::Migration[5.0]
  def change
    add_column :releases, :catno, :string
  end
end
