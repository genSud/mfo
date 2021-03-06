class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :type_o
      t.string :name
      t.string :fullname
      t.string :inn
      t.string :kpp
      t.string :ogrn
      t.string :head_position
      t.date :reg_date
      t.string :attachable_type

      t.references :order, index: true

      t.timestamps null: false
    end
  end
end
