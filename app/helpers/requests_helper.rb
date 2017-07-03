module RequestsHelper
  def created_at(request)
    request.created_at.strftime("%m/%d/%Y")
  end

  def updated_at(request)
    request.updated_at.strftime("%b %e, %Y %l:%M %p")
  end

  def status_button(request, action)
    if !current_user.client?
      form_tag "/projects/#{params[:project_id]}/requests/#{params[:id]}",
      method: :patch, class: "form-button" do
        hidden_field_tag('request[status]', "#{action}") +
        submit_tag("#{action.chomp('d')} Request", class: "button-link button-in-site")
      end
    end
  end

  def upload_button(request)
    form_tag "/projects/#{params[:project_id]}/requests/#{params[:id]}",
      method: :patch, class: "form-button" do
        hidden_field_tag('request[status]', "Client Submitted") +
        submit_tag('Upload File', class: "button-link button-in-site")
      end
  end

  def delete_button(request)
    if current_user.admin? || current_user.manager?
      link_to "Delete Request", project_request_path(request.project,request),
      data: { confirm: 'Are you sure?' }, method: :delete, class: "button-link
      button-in-site float-right"
    end
  end

end
