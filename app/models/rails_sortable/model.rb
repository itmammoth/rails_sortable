module RailsSortable
  #
  # Include this module to your ActiveRecord model.
  # And you must call `set_sortable` method for using sortable model.
  #
  # ex)
  # class SampleModel < ActiveRecord::Base
  #   include RailsSortable::Model
  #   set_sortable :sort, without_updating_timestamps: true
  # end
  #
  module Model
    def self.included(base)
      base.class_eval do
        before_create :maximize_sort
      end
      base.extend ClassMethods
    end

    def update_sort!(new_value)
      write_attribute sort_attribute, new_value
      if self.class.sortable_options[:silence_recording_timestamps]
        warn "[DEPRECATION] `silence_recording_timestamps` is deprecated. Please use `without_updating_timestamps` instead."
        without_updating_timestamps { save! }
      elsif self.class.sortable_options[:without_updating_timestamps]
        without_updating_timestamps { save! }
      else
        save!
      end
    end

  protected

    def maximize_sort
      return if read_attribute(sort_attribute)
      write_attribute sort_attribute, max_sort
    end

    def without_updating_timestamps
      raise ArgumentError unless block_given?
      original_record_timestamps = self.class.record_timestamps
      self.class.record_timestamps = false
      yield
      self.class.record_timestamps = original_record_timestamps
    end

    def max_sort
      (self.class.maximum(sort_attribute) || 0) + 1
    end

    def sort_attribute
      self.class.sort_attribute
    end

    module ClassMethods
      #
      # allowed options
      # - without_updating_timestamps
      #     When it is true, timestamp(updated_at) will be NOT touched on reordering.
      #
      def set_sortable(attribute, options = {})
        self.define_singleton_method(:sort_attribute) { attribute }
        self.define_singleton_method(:sortable_options) { options }
      end
    end
  end
end
