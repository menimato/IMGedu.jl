# Falta adaptar a função para diferentes resoluções radiométricas
# Para tanto, deve-se mudar o zeros(256)

function otsu_threshold_(in_img,t="image")
    tipo = typeof(in_img)

    img_orig = convert(Array{Float64},in_img)
    img = convert(Array{Int32},round(Int,in_img*255))

    d = size(img)
    hist = zeros(256)

    # Making the histogram
    for i=1:d[1]
        for j=1:d[2]
            hist[img[i,j]+1] += 1
        end
    end
    # end of the making

    total = d[1]*d[2]

    sumB = 0
    wB = 0
    max = 0.0
    sum1 = sum(img)

    for i=1:156
        wB += hist[i]
        wF = total - wB
        if wB == 0 || wF == 0
            continue
        end
        sumB = sumB + (i-1) * hist[i]
        mF = (sum1 - sumB) / wF
        between = wB * wF * ((sumB / wB) - mF) * ((sumB / wB) - mF)
        if between >= max
            level = i
            maximum = between
        end
    end

    level = level/255.0

    if t=="lvl"
        return(level)
    elseif t=="image"
        img_result = zeros(d)
        for i=1:d[1]
            for j=1:d[2]
                if img_orig[i,j] >= level
                    img_result[i,j] = 1.0
                end
            end
        end
        return(img_result)
    end
end
