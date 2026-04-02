class CreateJobs < ActiveRecord::Migration[8.1]
  def change
    create_table :jobs do |t|
      t.string :title, null: false
      t.string :company, null: false
      t.text :description, null: false
      t.string :location
      t.boolean :remote, default: false
      t.string :experience_level, null: false
      t.string :work_authorization, default: "any"
      t.string :language, default: "en"
      t.integer :salary_min
      t.integer :salary_max
      t.string :status, default: "pending"
      t.integer :fraud_score, default: 0
      t.datetime :verified_at
      t.datetime :expires_at
      t.boolean :hired, default: false
      t.datetime :filled_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end