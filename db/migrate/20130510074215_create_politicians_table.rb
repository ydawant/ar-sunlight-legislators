class CreatePoliticiansTable < ActiveRecord::Migration
  def change
    create_table :politicians do |t|
      t.string :title
      t.string :name
      t.string :party
      t.string :state
      t.boolean :in_office
      t.string :gender
      t.string :phone
      t.string :congress_office
      t.date :birthdate

      t.timestamps

    end
  end
end
