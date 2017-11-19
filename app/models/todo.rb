class Todo < ApplicationRecord
  validates_presence_of :title, :due_date
  #判斷是否可刪除
  def determine_destroy?
    due_date < Date.today
  end
end
