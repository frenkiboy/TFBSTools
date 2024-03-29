\name{getMatrixSet}
\docType{methods}
\alias{getMatrixSet}
\alias{getMatrixSet,character-method}
\alias{getMatrixSet,JASPAR2014-method}
\alias{getMatrixSet,SQLiteConnection-method}

\title{Advanced JASPAR database search functions \code{get_MatrixSet}}
\description{
  This function fetches matrix data for all matrices in the database 
  matching criteria defined by the named arguments 
  and returns a PFMatrixList object
}

\usage{
  \S4method{getMatrixSet}{character}(x, opts)
  \S4method{getMatrixSet}{SQLiteConnection}(x, opts)
  \S4method{getMatrixSet}{JASPAR2014}(x, opts)
}

\arguments{
  \item{x}{
    a character vector of length 1 for the path of JASPAR SQLite file, a \code{SQLiteConnection} object, or a \code{JASPAR2014} object.
  }
  \item{opts}{
    a search options list. See more details below.
  }
}

\details{
  The search options include three categories:

  (1) Database basic criterias: 
  
  \code{all=c(TRUE, FALSE)} 
  
  \code{ID}: a unique identifier for each model. 
    CORE matrices always have a "MAnnnnIDs.Version".
  
  \code{name}: The name of the transcription factor. 
    As far as possible, the name is based on the standardized 
    Entrez gene symbols. 
    In the case the model describes a transcription factor hetero-dimer, 
    two names are concatenated, such as RXR-VDR. 
    In a few cases, different splice forms of the same gene 
    have different binding specificity: in this case 
    the splice form information is added to the name, 
    based on the relevant literature.
  
  \code{collection=c("CORE", "CNE", "PHYLOFACTS", "SPLICE", 
    "POLII", "FAM", "PBM", "PBM_HOMEO", "PBM_HLH"}
  
  \code{all_versions=c(TRUE,FALSE)}
  
  \code{species}: The species source for the sequences, in Latin (Homo sapiens)
    or NCBI tax IDs (9606).
  
  \code{matrixtype=c("PFM", "PWM", "ICM")}

  (2) Tags based criterias: 
  
  \code{class}: Structural class of the transcription factor, 
    based on the TFCaT system. 
    Examples: "Zipper-Type"", "Helix-Turn-Helix", etc.
  
  \code{type}: Methodology used for matrix construction: 
    "SELEX", "ChIP-seq", "PBM", etc.
  
  \code{tax_group}: Group of species, 
    currently consisting of "plants", "vertebrates", "insects", 
    "urochordat", "nematodes", "fungi".
  
  \code{family}: Structural sub-class of the transcription factor, 
    based on the TFCaT system.
  
  \code{Acc}: A representative protein accession number in Genbank 
    for the transcription factor. 
    Human takes precedence if several exists. 
  
  \code{medline}: relevant publication reporting the sites 
  used in the mode building.
  
  \code{Pazar_tf_id}: PAZAR database id.
  
  (3) Further criterias: 
  
  \code{min_ic} (minimum total information content of the matrix)
  
  \code{length} (minimum sites length)
  
  \code{sites} (minimum average sites number per base)

  When \code{all} is \code{TRUE}, it will get all the matrices 
  and has higher priority over other options. 
  Then ID has the second highest priority, 
  and will ignore all the followiing options.
  The rest options are combined in search with AND, 
  while multiple elements under one options have the logical operator OR.
}

\author{
  Ge Tan
}

\seealso{
  \code{\link{getMatrixByID}},
  \code{\link{getMatrixByName}}
}

\examples{
  \donttest{
    library(JASPAR2014)
    db <- file.path(system.file("extdata", package="JASPAR2014"), 
                    "JASPAR2014.sqlite")
    opts <- list()
    opts[["species"]] <- 9606
    opts[["name"]] <- "RUNX1"
    #opts[["class"]] = "Ig-fold"
    opts[["type"]] <- "SELEX"
    opts[["all_versions"]] <- TRUE
    siteList <- getMatrixSet(db, opts)
    siteList2 <- getMatrixSet(JASPAR2014, opts)
  }
}

\keyword{methods}
\keyword{ ~~ other possible keyword(s) ~~ }
