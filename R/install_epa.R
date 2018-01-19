#' Download EPA air models
#'
#' Download the most recent version of EPA air models and install to chosen directory. 
#' @param model Names of EPA models to download. Supply multiple models as a vector -> \code{c("bpip", "aermod")}.
#'              Options: aermap, aermet, aermod, aerscreen, bpip, makemet.
#' @param dir Folder for installation. Defaults to working directory.
#' @keywords download EPA models install
#' @export
#' @examples
#' install_epa(model = c("aerscreen", "bpip"), dir = "EPA software")
# 
# 

install_epa <- function(model, 
                        dir              = getwd(),
                        add_model_folder = TRUE) {
  
  epa_urls <- c("aermap"    =  "https://www3.epa.gov/ttn/scram/models/aermod/aermap/aermap_exe.zip",
                "aermet"    =  "https://www3.epa.gov/ttn/scram/7thconf/aermod/aermet_exe.zip",
                "aermod"    =  "https://www.epa.gov/ttn/scram/models/aermod/aermod_exe.zip",
                "aerscreen" =  "https://www3.epa.gov/ttn/scram/models/screen/aerscreen_code.zip",
                "bpip"      =  "https://www3.epa.gov/ttn/scram/models/relat/bpipprime.zip",
                "makemet"   =  "https://www3.epa.gov/ttn/scram/models/screen/makemet_code.zip")
  
  for(i in 1:length(model)) {
    
    tf <- tempfile(model[i], fileext = ".zip")
  
    utils::download.file(epa_urls[model[i]], tf)
  
    utils::unzip(tf, exdir = paste0(dir, ifelse(add_model_folder, paste0("/", model[i]), "")))
    
  }
}
