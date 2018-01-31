module KatasHelper
  NO_LINK = ''
  def destroy_kata_link(id)
    return link_to('Delete', kata_path(id), { method: :delete, data: { confirm: 'Are you sure?' }}) if user_signed_in?
    NO_LINK
  end
end
