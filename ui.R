library(shiny); library(shinythemes)

shinyUI(fluidPage(
    theme = shinytheme("superhero"),
    titlePanel(""),
    sidebarLayout(
        sidebarPanel(
            
            width = 3,
            
            img(src = "250-250.png", 
                height = 270, 
                width = "100%"
            ),
            
            h6("*****************************************", align = "center"),
            h6(strong("DESENVOLVIMENTO"), align = "center"),
            h6("Pedro Carvalho Brom", align = "center"),
            h6("supermetrica@gmail.com", align = "center"),
            h6(a("facebook.com/supermetrica", href = "https://www.facebook.com/supermetrica", target="_blank"), align = "center"),
            h6(a("supermetrica.blogspot.com.br", href = "https://supermetrica.blogspot.com.br", target="_blank"), align = "center"),
            h6(a("github.com/pcbrom", href = "https://github.com/pcbrom", target="_blank"), align = "center"),
            h6("*****************************************", align = "center"),
            
            h3(strong("ATENÇÃO"), align = "center"),
            h5(
                "Em termos mais simples consideramos um modelo 'bom' quando sua 
               acurácia sensibilidade e especificidade são pelo menos 80%. 
               Portanto, podemos considerar que este modelo serve apenas como uma 
               'brincadeira de palpite'. O ponto que está ruim é a classificação
                de notícias verdadeiras, pois apesar do modelo ser sensível às
                informações, a especificidade ainda é muito baixa e isto implica
                em acusar uma notícia verdadeira como falsa. A medida Kappa
                também é importante para um modelo bem calibrado. Se está 
                próximo de 1 então o modelo está concordante com as informações
                de treino e de teste." , 
                br(),
                br(),
                "Este programa está em fase de desenvolvimento. Medidas atuais:",
                br(),
                br(),
                tableOutput('modelo.final.medidas'),
               align = "center"
            )
            
        ),
        
        mainPanel(
            
            h5(strong(toupper("Como o modelo foi construído?")),
               br(),
               br(),
                "A técnica utilizada é a de regressão logística combinada com aprendizagem de 
               máquinas. O intuito é calcular a probabilidade da notícia ser 
               verdadeira ou falsa dado suas métricas de caracteres e palavras, 
               usando apenas a informação do título e notícia. A base de dados foi 
               raspada do site", a("www.e-farsas.com", href = "http://www.e-farsas.com/", target="_blank"), 
                "e contém um total de 891 postagens, sendo aproximadamente 74% falsas. 
               Ou seja, de acordo com o site temos mais virais falsos do que 
               verdadeiros na circulando na internet.",
               br(),
               br(),
               br(),
               strong(toupper("Sugestões e críticas -> ")),
               "supermetrica@gmail.com",
               br(),
               br()
            ),
            
            h5(strong("EXEMPLO DE USO")),
            
            h5(
                "Vamos utilizar esta postagem como exemplo",
                a("\"China inaugura ônibus elevado!\"", href = "http://www.e-farsas.com/china-inaugura-onibus-elevado-sera-verdade.html", target="_blank"), ".",
                "De acordo com o site a notícia original é falsa.",
                br(),
                br(),
                strong("Título: "), "China inaugura ônibus elevado!",
                br(),
                br(),
                strong("Notícia: "), "Chineses teriam inaugurado o que seria uma revolução nos meios de transportes: Um ônibus que passa por cima dos carros, podendo levar até 1200 passageiros! Será?
                A notícia surgiu em diversos sites e portais no começo de agosto de 2016 e mostra um novo conceito em transporte de passageiros: Um ônibus elevado que poderia levar até 1200 passageiros por viagem e, por ser elevado, deixaria os veículos de passeio livres para passarem por baixo dele. Ou seja, o TEB-1 além de levar centenas de passageiros, ainda deixaria as ruas e avenidas livres para os veículos de passeio.
                As fotos da inauguração do “ônibus do futuro” se espalharam pela web e muita gente ficou curiosa para saber se isso é verdade ou farsa!
                Será que esse ônibus existe mesmo?",
                br(),
                br(),
                strong("Agora é só colar nos respectivos campos nas entradas e 
                       clicar em 'Consultar' e esperar aproximadamente 15 segundos.
                       Faça o teste com outras notícias. (são permitidas 
                       até 5 consultas)")
            ),
            
            wellPanel(
                textInput("titulo.entra", "Título", value = ""), 
                textInput("noticia.entra", "Notícia", value = ""),
                actionButton("conectar", "Consultar")
            ),
            
            tableOutput('resultado.predicao'),
            
            br(),
            br(),
            br(),
            br(),
            br(),
            br()
            
        )
    )
))
