########################################################
#Curso Single Cell
#Como vincular con github
########################################################

install.packages('gitcreds')
install.packages('gert')
install.packages('gh')

library(gitcreds)
library(gert)
library(gh)

#conectar con git
usethis::create_github_token()

#se coloca el token el parentesis va vacío
gitcreds::gitcreds_set()

#esto sale de esta linea
#Enter password or token: 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 #aquí poner token
#-> Adding new credentials...
#-> Removing credetials from cache...
#-> Done.

# Configurar usuario de gitHub
usethis::edit_git_config() # que abre el archivo .gitconfig

# colocaremos nombre y correo de cuenta de github. SOLO borrar los # y respetar los demas espacios
# [user]
#   name = N O M B R E
#   email = correodeGithub

# inicializar el repositorio de Git
usethis::use_git() #

# conectar tu repositorio local de Git con los servidores de GitHub
usethis::use_github()

gh::gh_whoami() # para checar cómo quedó la configuración

#Una vez que ya vinculamos nuestro repositorio con github podemos seguir
#actualizandolo. Vamos a checar brevemente algunos de los comandos que son
#útiles para ello:

getwd()

# escribimos un nuevo archivo e indicamos dónde lo queremos
writeLines("hola", "R/prueba.R")

# también podemos hacerlo así
usethis::use_r("archivo-prueba-github.R") # añade archivo al directorio R del proyecto actual

# Por ejemplo podríamos probar añadir algo nuevo
gert::git_add("R/archivo-prueba-github.R")

# añadimos commit de lo que se hizo
gert::git_commit("se subio archivo prueba")

# nos da info de los commits
gert::git_log()

# sube tus cambios del repo local a los de github
gert::git_push() # COMANDO IMPORTANTE
