# TODO: Codarbar support
require 'barby/barcode/code_39'
require 'barby/outputter/svg_outputter'

class Barcode < ActiveRecord::Base
  attr_accessible :code_word, :data
  validates_presence_of :code_word
  before_save :generate_barcode

  attr_accessor :start_rows, :start_cols

  paginates_per 10

  def generate_barcode
    self.data = Barby::Code39.new(code_word).to_svg(:width => 150, :height => 70)
  end

  def is_readable_by(user, parent = nil)
    true
  end
end
# == Schema Information
#
# Table name: barcodes
#
#  id         :integer         not null, primary key
#  code_word  :string(255)
#  data       :binary
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

