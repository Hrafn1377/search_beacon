class CreateSeekerProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :seeker_profiles do |t|
      t.string :resume_url
      t.string :experience_level
      t.string :work_authorization, default: "any"
      t.string :preferred_role
      t.integer :salary_min
      t.integer :salary_max
      t.boolean :open_to_remote, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
