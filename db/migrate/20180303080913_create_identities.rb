class CreateIdentities < ActiveRecord::Migration[5.1]
  def change
    create_table :identities, id: :uuid do |t|
      t.string :team_id,      limit: 25,  null: false
      t.string :provider,     limit: 25,  null: false
      t.string :scope,        limit: 255, null: false
      t.string :access_token, limit: 128,  null: false
      t.jsonb  :data

      t.timestamps
    end

    add_index :identities, :team_id
  end
end
