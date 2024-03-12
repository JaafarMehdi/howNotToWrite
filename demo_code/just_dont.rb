module JustDont

  ROW_HEADERS = [
    :name,
    :price,
    :kind,
    :quantity
  ].freeze

  def check_all_heades_present(file_headers, expanded=false)
    required_headers = ROW_HEADERS.dup
    required_headers << :expanded_header if expanded
    (required_headers - file_headers).empty?
  end

  def get_active_users_ids
    UserModel.where(active: true).pluck(:id)
  end

  def active_user?(user)
    user.deactivation_date.blank?
  end

  def user_status(user)
    return 'inactive' if user.deactivation_date.present?
    'active'
  end

  def addition(a, b)
    a + b
  end
end
