## Accessors
setGeneric("ID", signature="x", function(x) standardGeneric("ID"))
setGeneric("ID<-", signature="x", function(x, value) standardGeneric("ID<-"))
setGeneric("name", signature="x", function(x) standardGeneric("name"))
setGeneric("name<-", signature="x", function(x, value) standardGeneric("name<-"))
setGeneric("matrixClass", signature="x", function(x) standardGeneric("matrixClass"))
setGeneric("matrixClass<-", signature="x", function(x, value) standardGeneric("matrixClass<-"))
setGeneric("Matrix", signature="x", function(x) standardGeneric("Matrix"))
setGeneric("Matrix<-", signature="x", function(x, value) standardGeneric("Matrix<-"))
setGeneric("bg", signature="x", function(x) standardGeneric("bg"))
setGeneric("bg<-", signature="x", function(x, value) standardGeneric("bg<-"))
setGeneric("tags", signature="x", function(x) standardGeneric("tags"))

setGeneric("matrixType", signature="x", function(x) standardGeneric("matrixType"))
setGeneric("pseudocounts", signature="x", function(x) standardGeneric("pseudocounts"))
setGeneric("pseudocounts<-", signature="x", function(x, value) standardGeneric("pseudocounts<-"))
setGeneric("schneider", signature="x", function(x) standardGeneric("schneider"))
setGeneric("schneider<-", signature="x", function(x, value) standardGeneric("schneider<-"))
setGeneric("views", signature="x", function(x) standardGeneric("views"))
setGeneric("seqname", signature="x", function(x) standardGeneric("seqname"))
setGeneric("sitesource", signature="x", function(x) standardGeneric("sitesource"))
setGeneric("primary", signature="x", function(x) standardGeneric("primary"))
setGeneric("site1", signature="x", function(x) standardGeneric("site1"))
setGeneric("site2", signature="x", function(x) standardGeneric("site2"))
setGeneric("alignments", signature="x", function(x) standardGeneric("alignments"))
setGeneric("conservation1", signature="x", function(x) standardGeneric("conservation1"))
setGeneric("seqlength", signature="x", function(x) standardGeneric("seqlength"))
setGeneric("alnlength", signature="x", function(x) standardGeneric("alnlength"))


## Constructors
setGeneric("XMatrixList", signature="x",
           function(x, use.names=TRUE, ...)
             standardGeneric("XMatrixList")
           )


# JASPAR DB
setGeneric("getMatrixByID", signature="x", function(x, ID) standardGeneric("getMatrixByID"))
setGeneric("getMatrixByName", signature="x", function(x, name)  standardGeneric("getMatrixByName"))
setGeneric("getMatrixSet", signature="x", function(x, opts) standardGeneric("getMatrixSet"))
setGeneric("storeMatrix",
           function(x, pfmList) standardGeneric("storeMatrix")
           )
setGeneric("initializeJASPARDB", signature="x",
           function(x) standardGeneric("initializeJASPARDB"))
setGeneric("deleteMatrixHavingID", signature="x",
           function(x, IDs) standardGeneric("deleteMatrixHavingID"))

setGeneric("toICM", signature="x",
           function(x, pseudocounts=NULL, schneider=FALSE,
                    bg=c(A=0.25, C=0.25, G=0.25, T=0.25))
             standardGeneric("toICM")
           )

setGeneric("toPWM", signature="x",
           function(x, type="log2probratio", pseudocounts=NULL,
                    bg=c(A=0.25, C=0.25, G=0.25, T=0.25))
             standardGeneric("toPWM")
           )

setGeneric("plotLogo", signature="x",
           function(x, ic.scale = TRUE, xaxis = TRUE, yaxis = TRUE,
                    xfontsize = 15, yfontsize = 15) standardGeneric("plotLogo")
           )
setGeneric("total_ic", signature="x",
           function(x) standardGeneric("total_ic"))

setGeneric("searchSeq", signature="x",
           function(x, subject, seqname="Unknown", strand="*", min.score="80%")
             standardGeneric("searchSeq"))

setGeneric("searchAln",
           function(pwm, aln1, aln2, min.score="80%", windowSize=51L, cutoff=0.7,
                    conservation=NULL)
             standardGeneric("searchAln")
           )
setGeneric("doSiteSearch",
           function(pwm, aln1, aln2, min.score="80%", windowSize=51L, cutoff=0.7,
                    conservation=NULL)
             standardGeneric("doSiteSearch")
           )

setGeneric("calConservation",
           function(aln1, aln2, windowSize=51L, which="1")
             standardGeneric("calConservation")
           )
setGeneric("writeGFF3", signature="x", function(x) standardGeneric("writeGFF3"))
setGeneric("writeGFF2", signature="x", function(x) standardGeneric("writeGFF2"))
setGeneric("relScore", signature="x", function(x) standardGeneric("relScore"))