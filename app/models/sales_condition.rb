class SalesCondition < ApplicationRecord
  belongs_to :project
  validate :mp_date_cannot_be_in_prot_date

  def mp_date_cannot_be_in_prot_date
    if mp_date.present? && mp_date < prot_date
      errors.add(:mp_date, ": 試作日より過去の日付は使用できません")
      # flash[:notice] = '試作日より過去の日付は使用できません'
    end
  end

end
