import Base: haskey, getindex, setindex!, delete!

export RedBlackTree

###
#
# Red Black Tree
#
# Supported functionality
#   - haskey
#
###

# TODO Can this be re-used somewhere?
# TODO Put this in tree.jl or try to get this out of DataStructures?
abstract Tree{K,V}

type RedBlackTreeNode{K,V} <: Tree{K,V}
    key::K
    value::V
    left::Union(Nothing, Tree{K,V})
    right::Union(Nothing, Tree{K,V})
end

type RedBlackTree{K,V} <: Tree{K,V}
    root::Union(Nothing, RedBlackTreeNode{K,V})
    red::Bool

    #RedBlackTree() = new(EmptyTree{K,V}())
    # Well, this is kind of weird.. is there a way to do this so that we don't have to this to avoid instantiating instances of EmptyTree?
    # RedBlackTree(key::V, value::K) = new(RedBlackTreeNode{K,V}(key, value, EmptyTree{K,V}(), EmptyTree{K,V}()))
    # Is this right?
    RedBlackTree(key::V, value::K) = new(RedBlackTreeNode{K,V}(key, value, nothing, nothing))
end

_isred(tree::Nothing) = false
_isred(tree::RedBlackTree) = tree.red

haskey(tree::Nothing, key) = false
function haskey(tree::RedBlackTree, key)
    rootkey = tree.root
    if key == rootkey
        return true
    elseif key < rootkey
        return haskey(tree.left, key)
    else
        return haskey(tree.right, key)
    end
end

export RedBlackTree
