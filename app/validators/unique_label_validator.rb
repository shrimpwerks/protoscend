class UniqueLabelValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if Route.where(status: "active", label: value).where.not(id: record.id).size > 0
      record.errors[attribute] << (options[:message] || "is already in use.")
    end
  end
end
