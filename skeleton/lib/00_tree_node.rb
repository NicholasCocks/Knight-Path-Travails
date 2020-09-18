class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(value) #2, 3
        @value = value
        @parent = nil # 1
        @children = [] 
    end

    def parent=(parent_node)
        @parent.children.remove(self)
        
        if parent_node == nil
            #do nothing
        else !parent_node.children.include?(self) #and check if nil
  #      if !(self.parent_node == parent_node)
            parent_node.children << self 
        end

        @parent = parent_node 
    end
    #self needs a parent node, that node knows that it is the parent of this self 
    # 1 children = [1, 2]
    #2, 3 #parents = 1
    # 2.parent(1)

end