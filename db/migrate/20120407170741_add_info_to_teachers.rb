class AddInfoToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :name, :string
    add_column :teachers, :nip, :string
    add_column :teachers, :gender, :string
    add_column :teachers, :birth_place, :string
    add_column :teachers, :birth_day, :date
    add_column :teachers, :religion, :string
    add_column :teachers, :level, :string
    add_column :teachers, :picture, :string
    add_column :teachers, :subject_id, :integer
  end
end
