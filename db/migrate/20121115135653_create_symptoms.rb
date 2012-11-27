class CreateSymptoms < ActiveRecord::Migration
  def change
    create_table :symptoms do |t|
      t.string :whichsymptom
      t.datetime :whensymptom
      t.references :user

      t.timestamps
    end
    add_index :symptoms, :user_id
  end
end
