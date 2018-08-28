function median_threshold(in_img::AbstractMatrix)
    tipo = typeof(in_img)
    img = convert(Array{Float32},in_img)

    d = size(img)
    a = 0
    total = 0.0

    for i=1:d[1]
        for j=1:d[2]
            if img[i,j] != 0.0
                total += img[i,j]
                a += 1
            end
        end
    end

    level = total/a

    for i=1:d[1]
        for j=1:d[2]
            if img[i,j] > level
                img[i,j] = 1.0
            else
                img[i,j] = 0.0
            end
        end
    end

    return(convert(tipo,img))
end
