#' Download EPA air models
#'
#' Download the most recent version of EPA air models and install to chosen directory. 
#' @param model Names of EPA models to download. Supply multiple models as a vector -> \code{c("bpip", "aermod")}.
#'              Options include: aermap, aermet, aermod, aerscreen, bpip, makemet.
#' @param dir Folder for installation. Defaults to working directory.
#' @keywords download EPA models install
#' @export
#' @examples
#' install_epa(model = c("aerscreen", "bpip"), dir = "EPA software")
# 
#' install_epa(model = "all", dir = "EPA models")

install_epa <- function(model = "all", 
                        dir              = getwd(),
                        add_model_folder = TRUE) {
  
  epa_urls <- c("aermap"    =  "https://gaftp.epa.gov/Air/aqmg/SCRAM/models/related/aermap/aermap_exe.zip",
                "aermet"    =  "https://gaftp.epa.gov/Air/aqmg/SCRAM/models/met/aermet/aermet_exe.zip",
                "aermod"    =  "https://gaftp.epa.gov/Air/aqmg/SCRAM/models/preferred/aermod/aermod_exe.zip",
                "aerscreen" =  "https://gaftp.epa.gov/Air/aqmg/SCRAM/models/screening/aerscreen/aerscreen_code.zip",
                "bpip"      =  "https://gaftp.epa.gov/Air/aqmg/SCRAM/models/related/bpip/bpipprime.zip",
                "makemet"   =  "https://gaftp.epa.gov/Air/aqmg/SCRAM/models/screening/aerscreen/makemet_code.zip")
  
  if (tolower(model) == "all") model <- c("aermap", "aermet", "aermod", "aerscreen", "bpip", "makemet")
  
  for(i in 1:length(model)) {
    
    tf <- tempfile(model[i], fileext = ".zip")
  
    utils::download.file(epa_urls[model[i]], tf)
  
    utils::unzip(tf, exdir = paste0(dir, ifelse(add_model_folder, paste0("/", model[i]), "")))
    
  }
}
