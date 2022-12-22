class Task < ApplicationRecord
    belongs_to :parent, class_name: "Task", optional: true
    has_many :children, class_name: "Task", foreign_key: "parent_id"

    # before_save :check_children_completed

    # def check_children_completed
    #     puts "check_children_completed callback called"  # add debug output
    #     return unless parent.present?
    #     if parent.children.none? { |child| !child.completed? }
    #       parent.update(completed: true)
    #     else
    #       parent.update(completed: false)
    #     end
    #   end
      
      

    validate :all_children_completed, if: :completed_changed?

    def all_children_completed
      return unless completed?
      children.each do |child|
        unless child.completed?
          errors.add(:completed, "cannot be true if any child tasks are not completed")
        end
      end
    end



  end
  