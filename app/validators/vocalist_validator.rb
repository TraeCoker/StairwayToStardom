class VocalistValidator < ActiveModel::Validator
    def validate(record)
      if record.musicians.vocals == [] && record.vocalist_id == nil
        record.errors[:musicians] << "must select or create a vocalist."
      end
    end
  end 