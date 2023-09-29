class PolyTreeNode

  attr_reader :parent,:children,:value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    @parent.children.delete(self) unless @parent.nil?
    @parent = node
    unless node.nil?
        unless node.children.include?(self)
          node.children << self
        end
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "not child" if child_node.nil? || !children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value

    children.each do |ele|
        
    result = ele.dfs(target_value)
    return result unless result.nil?
    end
    nil
   end

   

end

