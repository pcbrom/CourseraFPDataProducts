library(shiny); require(caret); require(dplyr); require(stringi)
require(e1071); require(randomForest); require(kknn)

shinyServer(function(input, output) {
   
    observe({
        
        medidas = "https://www.dropbox.com/s/awb9vomazfkzj7s/resultados_modelo_final.rds?dl=1"
        modelo_final = readRDS(gzcon(url(medidas)))
        output$modelo.final.medidas = renderTable(modelo_final,
                                                  spacing = "xs")
        
        simplificado = "URL_HERE"
        simplificadoX = readRDS(gzcon(url(simplificado)))
        
        local.modelo1 = "URL_HERE"
        modelo1 = readRDS(gzcon(url(local.modelo1)))
        
        local.modelo2 = "URL_HERE"
        modelo2 = readRDS(gzcon(url(local.modelo2)))
        
        j = 1
        while (j != 5) {
            
            input$conectar
            if (input$conectar != 0) {
                
                titulo = input$titulo.entra
                noticia = input$noticia.entra
                
                resultado = function(titulo, noticia) {
                    
                    titulo = titulo %>% 
                        stri_trans_general(., "Latin-ASCII") %>% 
                        gsub('"', "", .) %>% 
                        trimws(., "both")
                    noticia = noticia %>% 
                        stri_trans_general(., "Latin-ASCII") %>% 
                        gsub('"', "", .) %>% 
                        trimws(., "both")
                    
                    c.w.titulo = nchar(titulo)/(sapply(gregexpr("\\W+", titulo), length))
                    char.titulo = nchar(titulo)
                    words.titulo = sapply(gregexpr("\\W+", titulo), length)
                    
                    c.w.noticia = nchar(noticia)/(sapply(gregexpr("\\W+", noticia), length))
                    char.noticia = nchar(noticia)
                    words.noticia = sapply(gregexpr("\\W+", noticia), length)
                    
                    db = cbind.data.frame(c.w.titulo, c.w.noticia, char.titulo, words.titulo,
                                          char.noticia, words.noticia) %>% 
                        rbind(simplificadoX)
                    
                    db$order = dist(db, method = "manhattan") %>% {hclust(.)$order}
                                        
                    probs = predict(modelo2, db[1,], type = "prob")
                    
                    return(probs)
                }
                
                probs = resultado(titulo = titulo, noticia = noticia)
                probs = paste0(round(100*probs, 2), "%")
                final = paste0("||| ",
                               titulo, 
                               " ||| Prob. Falso = ", 
                               probs[1], 
                               " ||| Prob Verdadeiro = ", 
                               probs[2],
                               " |||")
                
                output$resultado.predicao = renderText(final)
                
            }
            
            j = j + 1
        }
        
        
    })
    
})
