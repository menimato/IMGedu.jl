using Images

function filter_gauss_localsigma(image, mask_order::Number=3, c::Number=0.05)

  # Checks if the mask is right
  if mod(mask_order,2)!=1
    error("The input value for the mask order must be an odd number >=3.")
  end

  # Stores the input image's type and convert it into a matrix
  tipo = typeof(image)
  try
    image = convert(Array{Float32}, image)
  catch er
    error(er," --- Problem converting the single band image into an array.")
  end

  # Takes the image's dimensions and creates 'a' (a variable to help in the convolution)
  d = size(image)
  a = floor(Int,mask_order/2)

  # Variables to receive the masks created and the filtered image
  mask = Matrix(mask_order,mask_order)
  img1 = Matrix(d[1]-mask_order+1,d[2]-mask_order+1)

  # the convolution process itself
  for i = (a+1):(d[1]-a)
    for j = (a+1):(d[2]-a)

      ai=i-a;
      ia=i+a;
      aj=j-a;
      ja=j+a;

      σ = (c/std(image[ai:ia,aj:ja], corrected=true))^2

      if σ==0.0 || (1/(2*pi*σ^2))==0.0
        mask[:,:] = 0.0
        mask[a+1,a+1] = 1.0
      else
        for x=-a:a
          for y=-a:a
            mask[x+a+1,y+a+1] = convert(Float32,exp(-(x^2 + y^2)/(2*(σ^2))))
          end
        end
        mask = mask/sum(mask)
      end

      img1[i-a,j-a] = convert(Float32,sum(mask.*image[ai:ia,aj:ja]))

      if img1[i-a,j-a] > 1.0
          img1[i-a,j-a] = 1.0
      end
    end
  end

  # Converts the filtered image to the same input image type
  img1 = convert(tipo, img1)

  # Returns the result image and end of the function
  return(img1)
end
