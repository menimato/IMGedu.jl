function filter_gauss(image, sigma::Number=1.0, mask_order::Number=3)
  # Input description:
  #   image:      The image, wich is going to be blurred. The pixel-values must be an float matrix - range 0~1.
  #   sigma:      the sigma value for the mask creation, just as in the normal distribuition.
  #   mask_order: As the name says, it is basically the order of the mask, wich will be used to
  #               do the convolution trough the given image.
  #               mask_order must be a positive even number, bigger or equal to 3.

  tipo = typeof(image)

  try
    image = convert(Array{Float32}, image)
  catch er
    error(er," --- Problem converting the single band image into an array.")
  end

  d = size(image)

  img1 = zeros(d[1]-mask_order+1,d[2]-mask_order+1)

  # Creates the mask wich will be used
  factor = (1/(2*pi*(sigma^2)))
  a = floor(Int,mask_order/2)

  mask1 = ones(mask_order, mask_order)

  for x=-a:a
    for y=-a:a
      mask1[x+a+1,y+a+1] = factor*exp(-(x^2 + y^2)/(2*(sigma^2)))
    end
  end
  mask = mask1/sum(mask1)

  for i = 1:(d[1]-mask_order+1)
    for j = 1:(d[2]-mask_order+1)
      ai=i
      ia=i+mask_order-1
      aj=j
      ja=j+mask_order-1

      img1[i,j] = sum(mask.*image[ai:ia,aj:ja])
      if img1[i,j] > 1.0
          img1[i,j] = 1.0
      end
    end
  end

  img1 = convert(tipo, img1)

  return img1
end
