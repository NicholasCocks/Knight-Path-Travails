require_relative "00_tree_node.rb"

class KnightPathFinder
    attr_reader :root_node, :considered_positions

    @@valid_moveset = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]

    def self.valid_moves(pos)
        
        valid_moves = []
        @@valid_moveset.each do |move|
            new_move = []
            x = move[0] + pos[0]
            y = move[1] + pos[1]
            new_move << x
            new_move << y
            valid_moves << new_move
        end
        
        valid_moves.reject! { |move| move[0] < 0 || move[0] > 7 }
        valid_moves.reject! { |move| move[1] < 0 || move[1] > 7 }
        
        
        # debugger
        return valid_moves
    end

    def initialize(start_pos)
        @considered_positions = [start_pos]
        @root_node = PolyTreeNode.new(start_pos)
        self.build_move_tree
    end

    def new_move_positions(pos)
        possible_pos = KnightPathFinder.valid_moves(pos)
        possible_pos.reject! {|move| @considered_positions.include?(move)}
        possible_pos.each {|move| @considered_positions << move}
        return possible_pos #values
    end

    def build_move_tree
        queue = [@root_node]

        until queue.empty?
            node = queue.shift
            value = node.value
            possible_pos = self.new_move_positions(value)
            possible_pos.each do |val|
                new_node = PolyTreeNode.new(val)
                node.add_child(new_node)
                queue << new_node
            end
            
        end
        

        #root node

        #root node now is an entire tree

        #create queue with root node inside, keep looping until queue is empty,
        #new positions created off of each node shifted off of queue,
        #each new position of turned into node as part of element shifted off.

    end

    def find_path(end_pos)
        debugger
        end_node = @root_node.dfs(end_pos)
        path = [end_node] #end_nodes's parent


        until path[-1] == @root_node
            path << path[-1].parent
        end

        path.map! {|ele| ele = ele.value}
        
        return path.reverse
    end

end

new_path = KnightPathFinder.new([0,0])
new_path.find_path([3, 3])