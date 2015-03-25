class Organization < ActiveRecord::Base

  belongs_to :order, polymorphic: true

  has_one :person, class_name: 'Individual'
  has_one :bank_account
  has_one :founder

  accepts_nested_attributes_for :person
  accepts_nested_attributes_for :bank_account
  accepts_nested_attributes_for :founder


  validates :type_o, presence: true
  validates :inn, presence: true

  validates :kpp, presence: true, unless: :skip_kpp_validation
  attr_accessor :skip_kpp_validation

  validates :name, presence: true
  validates :fullname, presence: true

  validates :ogrn, presence: true
  validates :address_legal, presence: true
  validates :address_actual, presence: true
  validates :head_position, presence: true
  validates :reg_date, presence: true

end