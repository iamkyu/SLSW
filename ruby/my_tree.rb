# 사용자에게 해시 내부에 포함 된 구조를 받아들이는 Tree 작성
require 'test/unit'
require 'set'

class Tree
  attr_accessor :nodes, :root

  def initialize(struct={})
    @root = struct.keys[0]
    @nodes = struct[@root].collect { |k,v| Tree.new({ k => v })}
  end

  def visit_all(&block)
    visit &block
    nodes.each { |c| c.visit_all &block }
  end

  def visit(&block)
    block.call self
  end
end

class TestTree < Test::Unit::TestCase

  def setup
    @family = {
      "grandpa" => {
        "dad" => {"child1" => {}, "child2" => {}},
        "uncle" => {"child3" => {}, "child4" => {}}
      }
    }
    @num_nodes = 7
    @names = Set.new [
      "grandpa", "dad", "child1", "child2",
      "uncle", "child3", "child4"
    ]
  end

  def test_init
    tree = Tree.new @family
    assert_equal tree.root, 'grandpa'
    assert_equal tree.nodes.length, 2
  end

  def test_visit
    tree = Tree.new @family
    tree.visit do |gp|
      assert_equal tree.root, 'grandpa'
    end
  end

  def test_visit_all
    tree = Tree.new @family
    visits = 0
    names = Set.new
    tree.visit_all do |p|
      names << p.root
      visits += 1
    end
    assert_equal visits, @num_nodes
    assert_equal names, @names
  end

end
