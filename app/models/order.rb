class Order < ActiveRecord::Base


  has_one :borrower, ->{ where attachable_type: 'borrower'}, class_name: 'Organization', dependent: :destroy

  has_many :guarantor_legals, ->{ where attachable_type: 'guarantor_legal'}, class_name: 'Organization', dependent: :destroy
  has_many :guarantor_individuals, class_name: 'Individual', dependent: :destroy
  has_many :documents, dependent: :destroy


  accepts_nested_attributes_for :borrower, allow_destroy: true

  accepts_nested_attributes_for :guarantor_legals, allow_destroy: true
  accepts_nested_attributes_for :guarantor_individuals, allow_destroy: true
  accepts_nested_attributes_for :documents, allow_destroy: true


  validates :summa, presence: true, numericality: {greater_than: 0}
  validates :platform, presence: true
  validates :submission_deadline, presence: true
  validates :agent, presence: true
  #validates :agent_name, presence: true
  validates :agent_summa, presence: true
  validates :mfo_summa, presence: true
  validates :order_summa, presence: true
  #validates :number
  #validates :number_mfo
  #validates :number_data_protocol
  #validates :personal_number
  validates :create_date, presence: true
  validates :status, presence: true

end
