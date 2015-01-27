module ExoticDataStructures

    import Base: length, isempty, start, next, done
                 show, dump, empty!, getindex, setindex!, get, get!
                 in, haskey, keys, merge, copy, cat,
                 push!, pop!, shift!, unshift!,
                 union!, delete!, similar, sizehint,
                 isequal, hash,
                 map, reverse

    export RedBlackTree

    include("redblacktree.jl")

end # module
