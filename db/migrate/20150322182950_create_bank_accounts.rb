class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.string :account_number

      t.references :organization, index: true

      t.timestamps null: false
    end
  end
end
