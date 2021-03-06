FC = gfortran
SPARSEFLAG = -lumfpack -lamd -lcholmod -lcolamd -lsuitesparseconfig -lccolamd -lcamd -lrt -lgfortran -lblas
WALL = -Waliasing -Wampersand -Wconversion -Wsurprising -Wc-binding-type -Wintrinsics-std -Wintrinsic-shadow -Wline-truncation -Wtarget-lifetime -Winteger-division -Wreal-q-constant -Wunused  -Wundefined-do-loop
DBGFLAG = $(WALL) -Wextra -Wconversion -finit-real=nan -fcheck=all
FCFLAGS =  -O0 -fopenmp -ffree-line-length-1024  -fbacktrace -fimplicit-none $(SPARSEFLAG)
LDFLAGS =  -O0 -fopenmp -ffree-line-length-1024  -fbacktrace -fimplicit-none $(SPARSEFLAG)

MOD = umfpack.o Parameters.o Globals.o  Procedures.o 

SUBR = 	AllocateArrays.o SetParameters.o Grids.o IterateBellman.o HJBUpdate.o cumnor.o rtsec.o StationaryDistribution.o SaveSteadyStateOutput.o DistributionStatistics.o rtbis.o rtflsp.o InitialSteadyState.o FinalSteadyState.o SolveSteadyStateEqum.o Calibration.o MomentConditions.o dfovec.o newuoa-h.o newuob-h.o update.o trsapp-h.o biglag.o bigden.o mnbrak.o golden.o sort2.o  CumulativeConsumption.o  FnDiscountRate.o  OptimalConsumption.o FnHoursBC.o  ImpulseResponses.o IRFSequence.o Transition.o  SaveIRFOutput.o IterateTransitionStickyRb.o IterateTransOneAssetStickyRb.o FnCapitalEquity.o CumulativeConsTransition.o DiscountedMPC.o DiscountedMPCTransition.o


OBJ = $(MOD) $(SUBR)

Main: $(OBJ) Main.o
	$(FC) $(LDFLAGS)   $^ -o  $@ $(FCFLAGS)

%.o: %.f90
	$(FC) $(FCFLAGS) -c $<
