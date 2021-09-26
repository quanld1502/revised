class SetupTables < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.timestamps null: false
    end

    create_table :teams do |t|
      t.string :name, null: false
      t.timestamps null: false
    end

    create_table :stocks do |t|
      t.string :name, null: false
      t.timestamps null: false
    end

    create_table :transactions do |t|
      t.references :from_entity, polymorphic: true
      t.references :to_entity, polymorphic: true
      t.integer :transaction_type, null: false, default: 0, index: true
      t.bigint :amount, null: false, default: 0
    end
  end
end
