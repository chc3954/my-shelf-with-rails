class CreateDocuments < ActiveRecord::Migration[8.0]
  def change
    create_table :documents do |t|
      t.string :name
      t.integer :file_size
      t.string :file_type

      t.timestamps
    end
  end
end
