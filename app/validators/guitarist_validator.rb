class GuitaristValidator < ActiveModel::Validator
    def validate(record)
      if record.musicians.guitar == [] && record.guitarist_id == nil
        record.errors[:musicians] << "must select or create a guitarist."
      end
    end
  end 