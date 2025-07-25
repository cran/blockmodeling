#' @encoding UTF-8
#' @title An R package for Generalized and classical blockmodeling of valued networks
#' 
#' @description
#' This package is primarily meant as an implementation of Generalized blockmodeling. In addition, functions for computation of (dis)similarities in terms of structural and regular equivalence, plotting and other "utility" functions are provided.
#' 
#' 
#' @references Doreian, P., Batagelj, V., & Ferligoj, A. (2005). Generalized blockmodeling, (Structural analysis in the social sciences, 25). Cambridge [etc.]: Cambridge University Press.
#' 
#' \enc{Žiberna, A.}{Ziberna, A.} (2007). Generalized Blockmodeling of Valued Networks. Social Networks, 29(1), 105-126. doi: 10.1016/j.socnet.2006.04.002
#' 
#' \enc{Žiberna, A.}{Ziberna, A.} (2008). Direct and indirect approaches to blockmodeling of valued networks in terms of regular equivalence. Journal of Mathematical Sociology, 32(1), 57-84. doi: 10.1080/00222500701790207
#' 
#' \enc{Žiberna, A.}{Ziberna, A.} (2014). Blockmodeling of multilevel networks. Social Networks, 39(1), 46-61. doi: 10.1016/j.socnet.2014.04.002
#'
#' @examples
#' #Generating a simple network corresponding to the simple Sum of squares
#' # Structural equivalence with blockmodel:
#' # nul com
#' # nul nul
#' n <- 20
#' net <- matrix(NA, ncol = n, nrow = n)
#' clu <- rep(1:2, times = c(5, 15))
#' tclu <- table(clu)
#' net[clu == 1, clu == 1] <- rnorm(n = tclu[1] * tclu[1], mean = 0, sd = 1)
#' net[clu == 1, clu == 2] <- rnorm(n = tclu[1] * tclu[2], mean = 4, sd = 1)
#' net[clu == 2, clu == 1] <- rnorm(n = tclu[2] * tclu[1], mean = 0, sd = 1)
#' net[clu == 2, clu == 2] <- rnorm(n = tclu[2] * tclu[2], mean = 0, sd = 1)
#' 
#' # Computation of criterion function with the correct partition
#' res <- critFunC(M = net, clu = clu, approaches = "hom", homFun = "ss", blocks = "com")
#' res$err # The error is relatively small
#' plot(res)
#' 
#' # Computation of criterion function with the correct partition and correct pre-specified blockmodel
#' # Prespecified blockmodel used
#' # nul com
#' # nul nul
#' B <- array(NA, dim = c(1, 1, 2, 2))
#' B[1, 1, , ] <- "nul"
#' B[1, 1, 1, 2] <- "com"
#' B[1, 1, , ]
#' res <- critFunC(M = net, clu = clu, approaches = "hom", homFun = "ss", blocks = B)
#' err(res) # The error is relatively small
#' IM(res)
#' plot(res)
#' 
#' # Computation of criterion function with the correct partition
#' # and pre-specified blockmodel with some alternatives
#' # Prespecified blockmodel used
#' # nul nul|com
#' # nul nul
#' B <- array(NA, dim = c(2, 2, 2))
#' B[1, , ] <- "nul"
#' B[2, 1, 2] <- "com"
#' res <- critFunC(M = net, clu = clu, approaches = "hom", homFun = "ss", blocks = B)
#' err(res) # The error is relatively small
#' IM(res)
#' plot(res)
#' 
#' 
#' # Optimizing a very bad partition
#' cluStart <- rep(1:2, times = 10)
#' res <- optParC(M = net,
#'                clu = cluStart,
#'                approaches = "hom", homFun = "ss", blocks = "com")
#' clu(res) # Hopefully we get the original partition)
#' err(res) 
#' plot(res) 
#' 
#' # Optimizing 10 random chosen partitions with optRandomParC
#' res <- optRandomParC(M = net, k = 2, rep = 10,
#' approaches = "hom", homFun = "ss", blocks = "com")
#' clu(res) # Hopefully we get the original partition)
#' err(res) 
#' plot(res)
#' 
#' # Adapt network for Valued blockmodeling with the same model
#' net[net > 4] <- 4
#' net[net < 0] <- 0
#' 
#' # Computation of criterion function with the correct partition
#' res <- critFunC(M = net, clu = clu, approaches = "val",
#'                 blocks = c("nul", "com"), preSpecM = 4)
#' err(res) # The error is relatively small
#' IM(res)
#' # The image corresponds to the one used for generation of
#' # The network
#' plot(res)
#'
#' @author \enc{Aleš Žiberna}{Ales Ziberna}
#' @seealso \code{\link{optRandomParC}}, \code{\link{critFunC}}, \code{\link{optParC}}, \code{\link{IM}}, \code{\link{clu}}, \code{\link{err}}, \code{\link{plotMat}}
#' @keywords cluster graphs package
#' @name blockmodeling
#' @aliases blockmodeling-package
#' @useDynLib blockmodeling, .registration = TRUE
"_PACKAGE"