class AddInfoStudentToStudents < ActiveRecord::Migration
  def change
    add_column :students, :teacher_id, :integer
    add_column :students, :name, :string
    add_column :students, :nis, :string
    add_column :students, :gender, :string
    add_column :students, :birth_place, :string
    add_column :students, :birth_day, :date
    add_column :students, :religion, :string
    add_column :students, :level, :string
    add_column :students, :photo_student, :string
  end
end
