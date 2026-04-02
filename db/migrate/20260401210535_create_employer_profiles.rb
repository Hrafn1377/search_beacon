class CreateEmployerProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :employer_profiles do |t|
      t.string :company_name, null: false
      t.string :domain
      t.string :website
      t.boolean :verified, default: false
      t.integer :verification_score, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
