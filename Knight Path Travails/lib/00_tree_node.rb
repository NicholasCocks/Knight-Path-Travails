require "byebug"

class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(value) 
        @value = value
        @parent = nil 
        @children = [] 
    end

    def parent=(new_parent_node)
        # debugger
        @parent.children.delete(self) if @parent != nil
        
        if new_parent_node == nil
            @parent = new_parent_node 
        elsif !new_parent_node.children.include?(self) 
            new_parent_node.children << self 
        end

        @parent = new_parent_node 
    end
     
    def add_child(new_child)
        if @children.include?(new_child) == false
            @children << new_child
            new_child.parent = self
        end
    end

    def remove_child(child)
       raise "this isn't a child" if !@children.include?(child)
       child.parent = nil
       @children.delete(child)
    end


    def dfs(target)
        #check given self's value
        return self if self.value == target # base case
        # return if self.children.empty? #hey we hit a leaf self
        #if it's what we're looking for, return it
        #otherwise, recursively call dfs on each of the self's children
        self.children.each do |child|
            result = child.dfs(target)
            return result unless result.nil? 
        end
        return nil
        #if we haven't return after searching whole tree, return nil b?c target isn't in the tree
    end

    def bfs(target)
        queue = [self]
        until queue.empty?
            node = queue.shift
            return node if node.value == target
            queue.concat(node.children)
        end
        return nil
    end
end

