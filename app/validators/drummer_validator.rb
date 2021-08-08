class DrummerValidator < ActiveModel::Validator
    def validate(record)
      if record.musicians.drums == [] && record.drummer_id == nil 
        record.errors[:musicians] << "must select or create a drummer."
      end
    end
  end 