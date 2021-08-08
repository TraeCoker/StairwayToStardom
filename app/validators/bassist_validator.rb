class BassistValidator < ActiveModel::Validator
    def validate(record)
      if record.musicians.bass == [] && record.bassist_id == nil
        record.errors[:musicians] << "must select or create a bassist."
      end
    end
  end 