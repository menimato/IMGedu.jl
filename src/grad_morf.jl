using Images

function grad_morf(image::AbstractMatrix, mask_order::Number=3)

  tipo = typeof(image)

  img1 = dilation_(image,mask_order)
  img2 = erosion_(image,mask_order)

  ########################
  img1 = convert(Array{Float32}, img1)
  img2 = convert(Array{Float32}, img2)

  #Size of images
  dim = size(img1)

  #final image
  img3 = zeros(dim)

  #subtraction
  img3 = abs.(img1-img2)

  img3 = convert(tipo, img3)
  ########################

  return(img3)
end
