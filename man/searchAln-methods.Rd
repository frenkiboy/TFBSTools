\name{searchAln}
\docType{methods}
\alias{searchAln}
\alias{searchAln,PWMatrix,character,character-method}
\alias{searchAln,PWMatrix,character,missing-method}
\alias{searchAln,PWMatrix,DNAString,DNAString-method}
\alias{searchAln,PWMatrix,DNAStringSet,missing-method}
\alias{searchAln,PWMatrix,Axt,missing-method}
%\alias{searchAln,PWMatrix,PairwiseAlignmentTFBS,missing-method}
\alias{searchAln,PWMatrixList,character,character-method}
\alias{searchAln,PWMatrixList,character,missing-method}
\alias{searchAln,PWMatrixList,DNAString,DNAString-method}
\alias{searchAln,PWMatrixList,DNAStringSet,missing-method}
%\alias{searchAln,PWMatrixList,PairwiseAlignmentTFBS,missing-method}
\title{searchAln method}
\description{
  Scans a pairwise alignment of nucleotide sequences 
  with the pattern represented by the PWMatrix. 
  It reports only those hits that are present in equivalent positions 
  of both sequences and exceed a specified threshold score in both, 
  AND are found in regions of the alignment above the specified
  conservation cutoff value.
}

\usage{
  searchAln(pwm, aln1, aln2, seqname1="Unknown1", seqname2="Unknown2",
            min.score="80\%", windowSize=51L, 
            cutoff=0.7, strand="*", type="any", conservation=NULL,
            mc.cores=1L)
}

\arguments{
  \item{pwm}{
    A \link{PWMatrix} object or a \link{PWMatrixList} object.
  }
  \item{aln1}{
    A \code{DNAString}, \code{character}, \code{DNAStringSet} or \code{Axt}
    object can be used to represent the pairwise alignment.
    When the last two objects are used and have a length of 2, 
    the argument \code{aln2} can be missing.
  }
  \item{aln2}{
    A \code{DNAString}, \code{character}.
    It can be missing when aln1 is \code{DNAStringSet} or \code{Axt} object.
  }
  \item{seqname1,seqname2}{
    A \code{chracter} object for the name of sequence. 
    "Unknown1" and "Unknown2" are used by default.
    These two arguments are ignored when aln1 is \code{Axt}. 
    seqname is taken from \code{Axt}.
  }
  \item{min.score}{
    The minimum score for the hit. Can be given an character string 
    in the format of "80\%" or as a single absolute value.
    When it is percentage value, it means the percentage of the 
    maximal possible from the PWM.
  }
  \item{windowSize}{
    The size of the sliding window (in nucleotides) for calculating 
    local conservation in the alignment. 
    This should be an odd value.
  }
  \item{cutoff}{
    The conservation cutoff can be from 0 (0\% identity) to 1 (100\% identity).
    The regions which have lower conservation than the cutoff 
    will be discarded from the results of the pattern searching.
    The conservation is calculated by comparing the alignments 
    within the \code{windowSize}:
    1 for match and 0 for mismatch and gap.
  }
  \item{strand}{
    When searching the alignment, we can search the positive strand or 
    negative strand. 
    While strand is "*", it will search both strands and 
    return the results based on the positvie strand coordinate.
  }
  \item{type}{
    This argument can be "any" or "all". 
    When it is "any", one motif will be kept 
    if the maximal conservation value of  the motif is larger than the cutoff.
    When it is "all", one motif will be kept 
    if the minimal conservation value of the motif is larger than the cutoff.
  }
  \item{conservation}{
    A vector of conservation profile. 
    If not supplied, the conservation profile will be computed internally 
    on the fly.
  }
  \item{mc.cores}{
    The number of cpu threads to use when searching \code{Axt}. 
    1 is assigned by default.
  }
}

\value{
  A \code{SitePairSet} object is returned when pwm is a \code{PWMatrix}, 
  while a \code{SitePairSetList} is returned when pwm is a \code{PWMatrixList}.
}

\author{
  Ge Tan
}

\seealso{
  \code{\link{searchSeq}}
}

\examples{
  data(MA0003.2)
  pwm <- toPWM(MA0003.2)
  ## two character objects
  aln1 <- "ACTTCACCAGCTCCCTGGCGGTAAGTTGATC---AAAGG---AAACGCAAAGTTTTCAAG"
  aln2 <- "GTTTCACTACTTCCTTTCGGGTAAGTAAATATATAAATATATAAAAATATAATTTTCATC"
  sitePairSet <- searchAln(pwm, aln1, aln2, min.score="50\%",
                           cutoff=0.5, strand="*", type="any")
  as(sitePairSet, "DataFrame")
  as(sitePairSet, "data.frame")
  as.data.frame(sitePairSet)
  
  ## scan axt object
  library(CNEr)
  axtFilesHg19DanRer7 <- file.path(system.file("extdata", package="CNEr"), 
                                   "hg19.danRer7.net.axt")
  axtHg19DanRer7 <- readAxt(axtFilesHg19DanRer7)
  sitePairSet <-  searchAln(pwm, axtHg19DanRer7, min.score="80\%", 
                            windowSize=51L, cutoff=0.7, strand="*", 
                            type="any", conservation=NULL, mc.cores=2)
  GRangesTFBS <- toGRangesList(sitePairSet, axtHg19DanRer7)
}

\keyword{methods}

