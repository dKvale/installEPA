---  
dev version: 0.0.0.9000  
---  

# installEPA

This R package downloads a list of current EPA air models.  


EPA models include:  

- AERMAP 
- AERMET 
- AERMOD  
- AERSCREEN  
- BPIP
- MAKEMET


## Example

To download only AERSCREEN and BPIP:
```{r}
library(installEPA)

install_epa(model = c("aerscreen", "bpip"), dir = "EPA software")`
```

To download all available EPA air models (this is the default):
```{r}
install_epa(dir = "EPA software")
```
