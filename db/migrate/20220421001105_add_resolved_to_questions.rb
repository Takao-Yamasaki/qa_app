class AddResolvedToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :resolved, :boolean, default: false, null: false
  end
end
