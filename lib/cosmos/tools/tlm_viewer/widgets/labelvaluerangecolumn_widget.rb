# encoding: ascii-8bit

# Copyright 2014 Ball Aerospace & Technologies Corp.
# All Rights Reserved.
#
# This program is free software; you can modify and/or redistribute it
# under the terms of the GNU General Public License
# as published by the Free Software Foundation; version 3 with
# attribution addendums as found in the LICENSE.txt

require 'cosmos/tools/tlm_viewer/widgets/widget'
require 'cosmos/tools/tlm_viewer/widgets/multi_widget'
require 'cosmos/tools/tlm_viewer/widgets/label_widget'
require 'cosmos/tools/tlm_viewer/widgets/value_widget'
require 'cosmos/tools/tlm_viewer/widgets/rangecolumn_widget'

module Cosmos

  class LabelvaluerangecolumnWidget < Qt::Widget
    include Widget
    include MultiWidget

    def initialize(parent_layout, target_name, packet_name, item_name, low_value, high_value, value_type = :WITH_UNITS, characters = 8, width = 30, height = 100)
      super(target_name, packet_name, item_name, value_type)
      setLayout(Qt::VBoxLayout.new())
      layout.setSpacing(1)
      layout.setContentsMargins(0,0,0,0)
      @widgets << LabelWidget.new(layout, item_name)
      @widgets << RangecolumnWidget.new(layout, target_name, packet_name, item_name, low_value, high_value, value_type, width, height)
      @widgets << ValueWidget.new(layout, target_name, packet_name, item_name, value_type, characters)
      parent_layout.addWidget(self) if parent_layout
    end

    def self.takes_value?
      return true
    end
  end

end # module Cosmos
