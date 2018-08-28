using Images

function dilation_(image::AbstractMatrix, mask_order::Number=3)

  tipo = typeof(image)

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

      img1[i,j] = maximum(image[ai:ia,aj:ja])
    end
  end

  img1 = convert(tipo, img1)

  return(img1)

end
