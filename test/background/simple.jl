function test_ones(estimator)
    data = ones(10, 10)

    @test estimate_background(estimator, data) ≈ 1.0
    @test estimate_background(estimator, data, dims = 1) ≈ ones(1, 10)
    @test estimate_background(estimator, data, dims = 2) ≈ ones(10)
end

function test_zeros(estimator)
    data = zeros(10, 10)

    @test estimate_background(estimator, data) ≈ 0.0
    @test estimate_background(estimator, data, dims = 1) ≈ zeros(1, 10)
    @test estimate_background(estimator, data, dims = 2) ≈ zeros(10)
end

@testset "$E"  for E in [Mean, Median]
    @test estimate_background(E, ones(10, 10)) == estimate_background(E(), ones(10, 10))
    test_ones(E)
    test_zeros(E)
end

@testset "mode" begin
    x = [1,2,3,4,5,6,5,4,3,4,34,3,43,43,3,3,3,3,1]
    @test estimate_background(Mode, x) == 3
    @test estimate_background(Mode, x) == estimate_background(Mode(), x)
end