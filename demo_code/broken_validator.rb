class BrokenValidator

  def initialize
    #standard init
  end

  def process
  end

  def validate_client_profile
    errors = []
    errors << :invalid_name unless name_valid?
    errors << :invalid_grade unless grade_valid?
    { success: true, result: errors.blank?, errors: errors }
  end

  def name_valid?
    name.present?
  end

  def grade_valid?
    grade.present? && grade < max_grade && grade > min_grade
  end
end
