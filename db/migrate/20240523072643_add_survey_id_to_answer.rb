class AddSurveyIdToAnswer < ActiveRecord::Migration[7.0]
  def change
    add_reference(:answes, :survey, foreign_key: true, null: :false )
  end
end
