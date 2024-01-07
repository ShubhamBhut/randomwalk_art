function randomwalker(n::Integer)
   x = [0] 
   y = [0] 

    for i in 1:n
        step = rand((-1, 1))
        direction = rand(("x", "y"))
        if direction == "x"
            push!(x, x[i] + step)
            push!(y, y[i])
        else
            push!(y, y[i] + step)
            push!(x, x[i])
        end
    end
    return x, y
end

using Makie
using WGLMakie

function randomwalkerplots(walkers::Integer, steps::Integer)
    scene = Scene()
    f = Figure()
    ax = Axis(f[1, 1])
    for i in 1:walkers
        x, y = randomwalker(steps)
        lines!(x, y, linewidth=5, color=(rand(RGBf), 0.5))
    end
    f
end
