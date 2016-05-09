function lin_interp(grid, vals)
    function func(x::Real)
        if x <= grid[1]
            index_1 = 1
            index_2 = 2
        elseif x >= grid[length(grid)]
            index_1 = length(grid) - 1
            index_2 = length(grid)
        else
            index_1 = searchsortedfirst(grid, x)
            index_2 = searchsortedlast(grid, x)
        end
        x_1 = grid[index_1]
        x_2 = grid[index_2]
        y_1 = vals[index_1]
        y_2 = vals[index_2]
        
        y = ((y_2- y_1)/(x_2 - x_1))*(x - x_1) + y_1
        return y
    end
    
    function func{T<:Real}(x::AbstractVector{T})
        y = zeros(length(x))
        for i in 1:length(x)
            y[i] = func(x[i])
        end
        return y
    end
    
    return func
end