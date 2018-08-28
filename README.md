# IMGedu

## Do pacote

Este pacote foi criado com o intuito de servir como auxílio ao ensino de disciplinas englobadas pelo ramo do Processamento Digital de Imagens (PDI).

Um texto explicativo foi escrito para auxiliar os alunos no aprendizado sobre os algoritmos envolvidos no PDI, em específico no ramo das imagens orbitais. Tal documentação pode ser concontrada neste link: [Documentação](https://menimato.github.io/IMGedu.jl/)

## Funções

As funções podem ter seu código copiado e distribuído sem custos, além de ser aberto a sugestões.

As funções implementadas e seus parâmetros de entrada são descritos a seguir:

| Nome                        | Função                    | Parâmetros                                            |
|:----:                       |:-----------:              |:----------:                                           |
| Dilatação                   | dilation_()               | imagem, ordem da máscara (opcional)                   |
| Erosão                      | erosion_()                | imagem, ordem da máscara (opcional)                   |
| Filtro Gaussiano Adaptativo | filter_gauss_localsigma() | imagem, ordem da máscara (opcional), c (opcional)     |
| Filtro Gaussiano            | filter_gauss()            | imagem, sigma (opcional), ordem da máscara (opcional) |
| Filtro de Média             | filter_mean()             | imagem, ordem da máscara (opcional)                   |
| Filtro de Mediana           | filter_median()           | imagem, ordem da máscara (opcional)                   |
| operador de Sobel           | filter_sobel()            | imagem, direção da borda (opcional)                   |
| Gradiente Morfológico       | grad_morf()               | imagem, ordem da máscara (opcional)                   |
| Limiarização pela Mediana   | median_threshold()        | imagem                                                |
| Afinamento Mrfológico       | morph_thinning()          | imagem                                                |
| Limirização Método de Otsu  | otsu_threshold_()         | imagem, "image" ou "lvl" (opcional)                   |
