

using Images

function filter_mean(image::AbstractMatrix, mask_order::Number=3)

  tipo = typeof(image)

  if mod(mask_order,2)!=1
    error("The input value for the mask order must be an odd number, >=3.")
  end

  try
    image = convert(Array{Float32}, image)
  catch er
    error(er," --- Problem converting the single band image into an array.")
  end

  d = size(image)

  img1 = zeros(d[1]-mask_order+1,d[2]-mask_order+1)

  for i = 1:(d[1]-mask_order+1)
    for j = 1:(d[2]-mask_order+1)
      ai=i
      ia=i+mask_order-1
      aj=j
      ja=j+mask_order-1

      img1[i,j] = mean(image[ai:ia,aj:ja])
    end
  end

  img1 = convert(tipo, img1)

  return(img1)

end
