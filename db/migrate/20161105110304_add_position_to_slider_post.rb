class AddPositionToSliderPost < ActiveRecord::Migration[5.0]
  def up
    add_column :slider_posts, :position_number, :integer
    execute <<-SQL
      CREATE SEQUENCE slider_posts_position_number_seq START WITH 1 OWNED BY slider_posts.position_number;
      ALTER TABLE slider_posts ALTER COLUMN position_number SET DEFAULT nextval('slider_posts_position_number_seq');
      UPDATE slider_posts SET position_number = nextval('slider_posts_position_number_seq');
    SQL
  end

  def down
    remove_column :slider_posts, :position_number
  end
end
