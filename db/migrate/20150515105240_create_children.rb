class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.integer :skt_level
      t.string :integer
      t.integer :age
      t.string :sex
      t.string :name
      t.boolean :zhyvit
      t.boolean :stul
      t.boolean :uzd
      t.boolean :fpk
      t.boolean :disbakterioz
      t.boolean :spadkovist
      t.boolean :spadk_line1
      t.boolean :spadk_line2
      t.boolean :both_parents
      t.boolean :both_lines

      t.timestamps null: false
    end
  end
end
