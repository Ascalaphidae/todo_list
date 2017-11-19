module TodosHelper
  def delete_button(todo)
    if todo.determine_destroy?

    else  
      link_to '', todo_path(todo), class: 'glyphicon glyphicon-trash', method: :delete, data: {confirm: "Are you sure?"}
    end  
  end  
end
