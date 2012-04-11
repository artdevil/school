class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.integer :student_id
      t.string :mother_name
      t.string :mother_job
      t.string :mother_phone
      t.string :father_name
      t.string :father_job
      t.string :father_phone
      t.string :carers_name
      t.string :carers_job
      t.string :carers_phone

      t.timestamps
    end
  end
end
