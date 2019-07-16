class CreateAnswersusers < ActiveRecord::Migration[6.0]
  def change
    create_table :answersusers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true
      t.boolean :value

      t.timestamps
    end
  end
end
