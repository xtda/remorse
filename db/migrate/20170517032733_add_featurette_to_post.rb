class AddFeaturetteToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :featurette, :boolean, default: false
  end
end
