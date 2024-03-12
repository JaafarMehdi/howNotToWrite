module JustDont

  ROW_HEADERS = [
    :name,
    :price,
    :kind,
    :quantity
  ].freeze

  def check_all_heades_present(file_headers)
    (ROW_HEADERS - file_headers).empty?
  end

  def get_active_user
    UserModel.where(active: true).pluck(:id)
  end

  def active_user?(user)
    return 'active' if user.deactivation_date = nil
  end

  def addition(a, b)
    #  return the mathematical sum of a and b
    a + b
  end
end