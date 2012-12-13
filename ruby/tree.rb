class Tree
	attr_accessor :children, :node_name


	def initialize(hashTree = {}) #root case, expecting a tree
		@children = []
		@node_name = hashTree.keys[0] #root node is always of length one
		hashTree[@node_name].each_pair{|key,hash|
			@children.push(Tree.new({key,hash}))
		}
	end

	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block}
	end

	def visit(&block)
		block.call self
	end
end


#ruby_tree = Tree.new( "Ruby",
#	[Tree.new("Reia"), Tree.new("MacRuby")]  )

Hash_tree = {'grandpa' => {'dad' => {'son' => {}, 'daughter' => {}}, 'gay uncle' => {}}}

ruby_tree = Tree.new(Hash_tree)

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}

