module RecordAttribute

  def list_kind_from_data(data)
    first_matched_record = data.first[1].dig(:matched, :new_version)&.compact&.first
    return first_matched_record.dig(:attributes, :kind) if first_matched_record.blank?

    data.first[1].dig(:unmatched, 0, :attributes, :kind)
  end

  def list_kind_from_upload(data)
    result = list_kind_from_data(data)
    # above method checks only matched data, if there is none we need to check unmatched
    return result if result.present?

    data.first[1].dig(:unmatched, 0, :attributes, :kind)
  end
end