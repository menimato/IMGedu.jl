__precompile__()

module IMGedu

using Images, Colors, ImageView

export dilation_,
       erosion_,
       filter_gauss_localsigma,
       filter_gauss,
       filter_mean,
       filter_median,
       filter_sobel,
       grad_morf,
       median_threshold,
       morph_thinning,
       otsu_threshold_

# Functions
include("dilation_.jl")
include("erosion_.jl")
include("filter_gauss_localsigma.jl")
include("filter_gauss.jl")
include("filter_mean.jl")
include("filter_median.jl")
include("filter_sobel.jl")
include("grad_morf.jl")
include("median_threshold.jl")
include("morph_thinning.jl")
include("otsu_threshold_.jl")

end
