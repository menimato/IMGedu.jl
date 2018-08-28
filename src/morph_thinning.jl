# o algoritmo implementado segue o  descrito por Gonzalez e Woods
# Página 428

using Images

function morph_thinning(image::Matrix)
    # Entrada é uma imagem binária.
    tipo = typeof(image)

    mask = ones(Int32,3,3,8)

    mask[:,:,1] = convert(Array{Int32},[0 0 0;-1 1 -1;1 1 1])
    mask[:,:,2] = convert(Array{Int32},[-1 0 0;1 1 0;1 1 -1])
    mask[:,:,3] = convert(Array{Int32},[1 -1 0;1 1 0;1 -1 0])
    mask[:,:,4] = convert(Array{Int32},[1 1 -1;1 1 0;-1 0 0])
    mask[:,:,5] = convert(Array{Int32},[1 1 1;-1 1 -1;0 0 0])
    mask[:,:,6] = convert(Array{Int32},[-1 1 1;0 1 1;0 0 -1])
    mask[:,:,7] = convert(Array{Int32},[0 -1 1;0 1 1;0 -1 1])
    mask[:,:,8] = convert(Array{Int32},[0 0 -1;0 1 1;-1 1 1])

    s = size(image)

    image=convert(Array{Int32},image)
    contador = 1
    resultado = image
    análise = zeros(Int32,s.+2)
    análise[2:s[1]+1,2:s[2]+1] = resultado

    while contador!=0
        contador=0
        for k=1:8
            for i=1:s[1]
                for j=1:s[2]
                    if análise[i+1,j+1]==1
                        true_or_false = (mask[:,:,k].==análise[i:i+2,j:j+2])
                        if count(x->x==false,true_or_false)>2
                            resultado[i,j]=image[i,j]
                        else
                            resultado[i,j]=0
                            contador +=1
                        end
                    else
                        resultado[i,j]=0
                    end
                end
            end
            análise[2:s[1]+1,2:s[2]+1] = resultado
        end
    end
    return(convert(tipo,resultado))
end
