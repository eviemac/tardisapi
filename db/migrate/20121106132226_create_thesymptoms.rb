class CreateThesymptoms < ActiveRecord::Migration
  def change
    create_table :thesymptoms do |t|
      t.string :whichsymptom
      t.datetime :whensymptom
      t.references :user

      t.timestamps
    end

    add_index :thesymptoms, :user_id
  end
end