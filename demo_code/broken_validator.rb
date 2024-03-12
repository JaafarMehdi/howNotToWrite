class BrokenValidator

  def initialize
    #standard init
  end

  def process
  end

  def validate_client_profile
    errors = []
    valid_name = validate_name
    valid_grade = validate_grade
    errors << :invalid_name unless valid_name
    errors << :invalid_grade unless valid_grade
    { success: true, result: errors.blank?, errors: errors }
  end

  def validate_name
    name.present?
  end

  def validate_grade
    grade.present? && grade < max_grade && grade > min_grade
  end
end