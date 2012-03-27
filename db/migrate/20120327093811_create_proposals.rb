class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
