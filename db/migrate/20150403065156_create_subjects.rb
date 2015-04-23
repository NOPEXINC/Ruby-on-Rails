class CreateSubjects < ActiveRecord::Migration
  def up
    create_table :subjects do |t|
	t.string 'name', :limit => 30
	t.integer 'position'
	t.boolean 'visible'
	
      t.timestamps
    end
  end

  def down
	drop_table :subjects
  end   

end
