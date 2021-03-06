module RequestsHelper
  def created_at(request)
    request.created_at.in_time_zone('Eastern Time (US & Canada)').strftime("%m/%d/%Y")
  end

  def updated_at(request)
    request.updated_at.in_time_zone('Eastern Time (US & Canada)').strftime("%m/%d/%Y %l:%M %p")
  end

  def status_button(request, action)
    if policy(request).full_update?
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
    if policy(request).destroy?
      link_to "Delete Request", project_request_path(request.project,request),
      data: { confirm: 'Are you sure?' }, method: :delete, class: "button-link
      button-in-site float-right"
    end
  end

  def request_status_td(request)
    if request.status == "Open"
      content_tag(:td, request.status, class: "status-open")
    elsif request.status == "Client Submitted"
      content_tag(:td, request.status, class: "status-sub")
    elsif request.status == "Closed"
      content_tag(:td, request.status, class: "status-closed")
    else
      content_tag(:td, request.status)
    end
  end

end
