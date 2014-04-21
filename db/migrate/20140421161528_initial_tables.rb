class InitialTables < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone
      t.integer :user_id
    end

    create_table :messages do |t|
      t.string :to
      t.string :from
      t.string :body
      t.string :status
      t.integer :user_id
    end

    create_table :contacts_messages do |t|
      t.belongs_to :contact
      t.belongs_to :message
    end

  end
end
