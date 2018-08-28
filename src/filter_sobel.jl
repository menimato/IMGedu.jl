using Images, Colors

function filter_sobel(image::AbstractMatrix, direction::String="-")

  tipo = typeof(image)

  try
    image = convert(Array{Float32}, image)
  catch er
    error(er,"\nProblem converting the image into an array.\n")
  end

  if direction=="-"
    mask_x = [-1 0 1; -2 0 2; -1 0 1];
    mask_y = [1 2 1; 0 0 0; -1 -2 -1];

    Gx = imfilter(image,centered(mask_x));
    Gy = imfilter(image,centered(mask_y));

    d1 = size(Gx);
    d2 = size(Gy);

    if d1!=d2
      error("Problem during the function's execution.")
    end

    img_final = zeros(d1[1],d1[2])

    for i = 1:d1[1]
      for j = 1:d1[2]

        img_final[i,j] = sqrt((Gx[i,j]^2)+(Gy[i,j]^2))

        if img_final[i,j]>1.0
          img_final[i,j]=1.0;
        elseif img_final[i,j]<0.0
          img_final[i,j]=0.0;
        end

      end
    end
elseif direction=="W->E"
    mask = [1 2 1; 0 0 0; -1 -2 -1];
    img_final = imfilter(image,centered(mask));
    d1 = size(img_final);
    for i = 1:d1[1]
      for j = 1:d1[2]
        if img_final[i,j]>1.0
          img_final[i,j]=1.0;
        elseif img_final[i,j]<0.0
          img_final[i,j]=0.0;
        end
      end
    end
elseif direction=="N->S"
    mask = [-1 0 1; -2 0 2; -1 0 1];
    img_final = imfilter(image,centered(mask));
    d1 = size(img_final);
    for i = 1:d1[1]
      for j = 1:d1[2]
        if img_final[i,j]>1.0
          img_final[i,j]=1.0;
        elseif img_final[i,j]<0.0
          img_final[i,j]=0.0;
        end
      end
    end
  elseif direction=="NW->SE"
    mask = [0 1 2; -1 0 1; -2 -1 0];
    img_final = imfilter(image,centered(mask));
    d1 = size(img_final);
    for i = 1:d1[1]
      for j = 1:d1[2]
        if img_final[i,j]>1.0
          img_final[i,j]=1.0;
        elseif img_final[i,j]<0.0
          img_final[i,j]=0.0;
        end
      end
    end
  elseif direction=="SW->NE"
    mask = [-2 -1 0; -1 0 1; 0 1 2];
    img_final = imfilter(image,centered(mask));
    d1 = size(img_final);
    for i = 1:d1[1]
      for j = 1:d1[2]
        if img_final[i,j]>1.0
          img_final[i,j]=1.0;
        elseif img_final[i,j]<0.0
          img_final[i,j]=0.0;
        end
      end
    end
  else
    error("The position value must be an Text variable. Available values are: W->E, N->S, NW->SE, and SW->NE. This is not a mandatory field.\n");
  end

  img_final = convert(tipo, img_final)
  return(img_final)
end
