class CreateSections < ActiveRecord::Migration
  def up
    create_table :sections do |t|
	t.integer 'page_id'
	t.string 'name' ,:limit => 40
	t.integer 'position'
	t.boolean 'visible'
	t.string 'content_type'
	t.text 'content'
      t.timestamps 
    end
	add_index('sections','page_id')
	add_index('sections','name')
  end

  def down
	drop_table :sections
  end
end
