class MusiciansValidator < ActiveModel::Validator
    def validate(record)
        instruments = record.musicians.collect do |m|
            m.instrument 
        end 
      unless instruments.count == 4
        record.errors[:musicians] << "must select or create one vocalist, guitarist, drummer, and bassist."
      end
    end
  end 