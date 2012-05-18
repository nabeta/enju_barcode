# TODO: Codarbar support
require 'barby/barcode/code_39'
require 'barby/outputter/svg_outputter'

class Barcode < ActiveRecord::Base
  validates_presence_of :code_word
  before_save :generate_barcode

  attr_accessor :start_rows, :start_cols

  def self.per_page
    10
  end

  def generate_barcode
    self.data = Barby::Code39.new(code_word).to_svg(:width => 150, :height => 70)
  end

  def is_readable_by(user, parent = nil)
    true
  end
end
